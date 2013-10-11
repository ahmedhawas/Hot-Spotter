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

		if @user.update_attributes user_params
			
    else

    end

    	respond_to do |format|
      		# format.html # index.html.erb
      		format.js {render json: @users, content_type: 'text/json' }
   		end
  end

  def show
    @user=current_user
  end
  

  private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :lat, :long, :avatar)
	end
end
