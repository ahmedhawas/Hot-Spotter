class UpdatesController < ApplicationController

	def index
		@updates = Update.all
	end

	def new
		@updates = Update.new
	end



end
