class UpdatesController < ApplicationController
	include ActionController::Live

	before_filter :require_login
	before_filter :require_user

	def index
		@updates = Update.all
		if logged_in?
			@lat_lng = cookies[:lat_lng].split("|")
			@user.lat = @lat_lng[0].to_f
			@user.long = @lat_lng[1].to_f
			@user.save
		end
	end

	def new
		@update = @user.updates.build
	end

	def create
			response.headers["Content-Type"] = "text/javascript"
	    attributes = params.require(:update).permit(:comment)
	    @update = Update.create(attributes)
	    $redis.publish('updates.create', @update.to_json)

	    # @update = @user.updates.build update_params

	    # if @update.save
	    # 		$redis.publish('updates.create', @update.to_json)
	    # 		redirect_to updates_path, notice: "Update posted!"
	    # else
	    #   	render :new
	    # end
	end

	#publishes events to the browser
def events
    response.headers["Content-Type"] = "text/event-stream"
    redis = Redis.new
    redis.psubscribe('updates.*') do |on|
      on.pmessage do |pattern, event, data|
        response.stream.write("event: #{event}\n")
        response.stream.write("data: #{data}\n\n")
      end
    end
  	rescue IOError
    	logger.info "Stream closed"
  	ensure
    	redis.quit
    	response.stream.close
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
