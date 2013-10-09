class UpdatesController < ApplicationController
	before_filter :require_login
	before_filter :require_user

	def index
		@updates = Update.all
		
		@lat_lng = cookies[:lat_lng].split("|")
		@user.lat = @lat_lng[0].to_f
		@user.long = @lat_lng[1].to_f
		@user.save
	end

	def new
		@update = @user.updates.build
	end

	def create
	    @update = @user.updates.build update_params
	    if @update.save
	      	redirect_to updates_path, notice: "Update posted!"
	    else
	      	render :new
	    end
	end

	protected
	
	def require_user
		@user = current_user
	end

	private

	def update_params
		params.require(:update).permit(:comment)
	end
end
