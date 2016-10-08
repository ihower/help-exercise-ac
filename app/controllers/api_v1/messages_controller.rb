class ApiV1::MessagesController < ApiController
	def index
		@messages = Message.all
		render :json => @messages.to_json
	end

	def show
		@message = Message.find(params[:id])
		render :json => @message.to_json		
	end
end
