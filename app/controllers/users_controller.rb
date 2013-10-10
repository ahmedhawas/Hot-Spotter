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

	

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
