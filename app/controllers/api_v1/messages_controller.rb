class ApiV1::MessagesController < ApiController
	def index
		@messages = Message.all
		# render :json => @messages.to_json
	end
end
