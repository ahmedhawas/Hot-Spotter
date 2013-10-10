class UpdatesController < ApplicationController
	before_filter :require_login
	before_filter :require_user



	def index
		@updates = Update.all
		@heatmap_data = get_heatmap_data.to_json
		# puts @heatmap_data 
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
		params.require(:update).permit(:comment)
	end
end
