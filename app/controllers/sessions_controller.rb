class SessionsController < ApplicationController

	def new

	end

	def create
	  	@user = login(params[:username], params[:password])
	  	
	    if @user  
	    	flash[:notice] = "Logged in!"
	      redirect_back_or_to updates_path  
	    else  
	    	flash[:notice] = "Invalid" 
	      render "new"  
	    end  

	end

	def destroy 
		logout  
		# flash[:notice] = "Bye"
 		redirect_to root_url
	end

end
