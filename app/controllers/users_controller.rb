class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    @user.likes=0
		if @user.save
			auto_login(@user)
  			flash[:success] = "Account created"
  			redirect_to updates_path
  		else 
  			render "new"
  		end
	end


	def update
		@user = current_user
    @user.update_attributes user_params

		if @user.save
      respond_to do |format|
          format.html { redirect_to user_path(params[:id]) , notice: 'Profile pic changed'}
          format.js {render json: @users, content_type: 'text/json'}
      end
    else
      redirect_to user_path(params[:id])
    end


  end

  def show
    @user=current_user
    @updates=@user.updates.order("created_at DESC")
  end
  

  private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :lat, :long, :avatar,:facebook_img)
	end
end
