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

		@lastUpdateTime = Time.now.localtime.strftime("%I:%M%p") 
		
	end

	def create
		@category = Category.new
		@update = @user.updates.build update_params

    @update.lat=@user.lat
    @update.long=@user.long
    @update.likes=0

   	@updates = Update.order("created_at DESC").where("created_at > ?", Time.at(params[:after].to_i+1))



	  	#Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'

		# response = Firebase.push("updates",{username:@update.user.username, comment:@update.comment, likes:@update.likes, attachment:@update.attachment, lat:@update.lat , long:@update.long , created_at:@update.created_at})
	    # firebase_id = Update.last.id.to_i
	  	# Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'
		# response = Firebase.push("updates/",{username:@update.user.username, comment:@update.comment, likes:@update.likes, attachment:@update.attachment, lat:@update.lat , long:@update.long , created_at:Time.now.localtime.strftime("%I:%M%p")})
		# response = Firebase.push( firebase_id ,{username:@update.user.username, comment:@update.comment, likes:@update.likes, attachment:@update.attachment, lat:@update.lat , long:@update.long , created_at:Time.now.localtime.strftime("%I:%M%p")})
		
		respond_to do |format|
	    if @update.save
	    	  	format.html {redirect_to updates_path} 
      			# format.js {render json: @updates, content_type: 'text/json' }
      			format.js
	   	  		# redirect_to updates_path, notice: "Update posted!"
	    else
	      	format.html{ render :updates }
	      	format.js {}
	    end
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
	
	def get_firebase_data
		Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'
		firebase_updates = Firebase.get("updates")

		firebase_updates.body.each_key do |key|
      		updateTime = firebase_updates.body[key]["created_at"]
      		if( updateTime >= @lastUpdateTime)
      			newUpdate.push(firebase_updates.body[key])
      		end
    	end 
    	@lastUpdateTime = updateTime


    	respond_to do |format|
    		format.json {render :json => 'newUpdate'}
    	end
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
