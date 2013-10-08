class UpdatesController < ApplicationController
	before_filter :require_login

	def index
		@updates = Update.all
	end

	def new
		@updates = Update.new
	end

	def create
	    @update = Update.new
	    if @update.save
	      	redirect_to root, notice: "Update posted!"
	    else
	      	render :new
	    end
	end

end
