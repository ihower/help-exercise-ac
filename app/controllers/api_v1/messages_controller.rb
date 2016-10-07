class ApiV1::MessagesController < ApiController


	# GET http://localhost:3000/api/v1/messages.json
	def index
		@messages = Message.all
	end
end

