class UpdatesController < ApplicationController
	before_filter :require_login
	before_filter :require_user

	def index

		@updates = Update.order("created_at DESC")

		# @updates = Update.all
		@update = @user.updates.build

		@heatmap_data = get_heatmap_data.to_json
		@update = @user.updates.build
		# puts @heatmap_data 

		Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'
		@firebase_updates = Firebase.get("updates")
	end

	def create
		@category = Category.new
		debugger
		@update = @user.updates.build update_params

	    @update.lat=@user.lat
	    @update.long=@user.long
	    @update.likes=0

	    Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'
		response = Firebase.push("updates",{username:@update.user.username, comment:@update.comment, likes:@update.likes, attachment:@update.attachment, lat:@update.lat , long:@update.long ,created_at:@update.created_at})

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
		current_user.like!(@update)
		#updating the likes for that update
		@update.likes +=1
		@update.save!
		#updating the likes for the user creating the update
		update_owner = @update.user
		update_owner.likes+=1
		update_owner.save!

		redirect_to updates_path
	end

	def unlike
		@update = Update.find(params[:update_id])
		current_user.unlike!(@update)
		@update.likes -=1
		@update.save!

		update_owner = @update.user
		update_owner.likes-=1
		update_owner.save!
		
		redirect_to updates_path
	end

	def get_heatmap_data
		users = User.all 
		users.map { |user| {:lat => user.lat, :lng => user.long} }
	 	
	end

	protected
	
	def require_user
		@user = current_user
	end

	private

	def update_params
		params.require(:update).permit(:comment,:likes, :attachment, :lat, :long, :category_ids, :user_id)
	end
end
