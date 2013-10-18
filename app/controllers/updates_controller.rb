class UpdatesController < ApplicationController
	before_filter :require_login
	before_filter :require_user

	def index

		@updates = Update.order("created_at DESC").where("created_at > ?", Time.at(params[:after].to_i+1))

		# @updates = Update.all
		@update = @user.updates.build

		@heatmap_data = get_heatmap_data.to_json
		@update = @user.updates.build

		@updates_positions= get_updates_data.to_json
		# puts @heatmap_data 

		# Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'
		# @firebase_updates = Firebase.get("updates")
	end

	def create
		@category = Category.new
		@update = @user.updates.build update_params

	    @update.lat=@user.lat
	    @update.long=@user.long
	    @update.likes=0


	  	#Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'

		# response = Firebase.push("updates",{username:@update.user.username, comment:@update.comment, likes:@update.likes, attachment:@update.attachment, lat:@update.lat , long:@update.long , created_at:@update.created_at})

	    if @update.save
	    	  respond_to do |format|
	    	  	format.html {redirect_to updates_path} 
      			format.js {render json: @updates, content_type: 'text/json' }
   				end
	   	  	# redirect_to updates_path, notice: "Update posted!"
	    else
	      	render :updates
	    end
	  
	end

	def destroy
		@update = Update.find(params[:id])
		@update.attachment = nil
		@update.save
		redirect_to updates_path
	end

	def like
		@update = Update.find(params[:update_id])
		
		#updating the likes for that update
		if current_user.likes?(@update)
			current_user.unlike!(@update)
			@update.likes -=1
			@update.save!
			update_owner = @update.user
			update_owner.likes -=1
			update_owner.save!
		else
			current_user.like!(@update)
			@update.likes +=1
			@update.save!
			update_owner = @update.user
			update_owner.likes+=1
			update_owner.save!
		end

		respond_to do |format|
			format.html { redirect_to updates_path }

			# Add error handling if necessary
			format.json { render :json => {error: false} }
		end
	end

	def get_heatmap_data
		users = User.all 
		users.map { |user| {:lat => user.lat, :lng => user.long} }
	end

	def get_updates_data
		updates = Update.all 
		updates.map { |update| {:lat => update.lat, :lng => update.long, :cat => update.category_ids[0]} }
	end
	
	protected
	
	def require_user
		@user = current_user
	end

	private

	def update_params
		params.require(:update).permit(:comment,:likes, :attachment, :lat, :long, :user_id, :category_ids =>[])
	end
end
