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

	def live
		# @updates = Update.last

		response.headers['Content-Type'] = 'text/event-stream'

		# where we check for a change in the database
		# @updates.each do |update|
			# @updates.listen do |comment|
			# 	response.stream.write("data: #{JSON.dump comment}")
			# end
		# end
		start = Time.zone.now
  	10.times do
    Update.uncached do
      Update.where('created_at > ?', start).each do |message|
        response.stream.write "data: #{message.to_json}\n\n"
        start = Time.zone.now
     end 
   	end
   	sleep 2
  	end
	rescue IOError
		logger.info "Stream closed"
		# connection was closed from client
	ensure
		response.stream.close

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
