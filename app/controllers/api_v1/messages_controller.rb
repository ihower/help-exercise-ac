class ApiV1::MessagesController < ApplicationController

	def index
		@messages = Massage.all
	end
end
