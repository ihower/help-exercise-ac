class ApiV1::MessagesController < ApiV1::ApiController
	def index
		@massages=Message.all
	end
end
