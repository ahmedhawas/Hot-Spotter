class UpdatesController < ApplicationController
	before_filter :require_login
	before_filter :require_user

	def index
		@updates = Update.all
	end

	def new
		@update = @user.updates.build
	end

	def create
	    @update = @user.updates.build update_params
	    @update.likes=0
	    if @update.save
	      	redirect_to updates_path, notice: "Update posted!"
	    else
	      	render :new
	    end
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

	protected
	
	def require_user
		@user = current_user
	end

	private

	def update_params
		params.require(:update).permit(:comment,:likes)
	end
end
