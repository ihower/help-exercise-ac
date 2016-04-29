class ApiV1::MessagesController < ApiController

  def index
    render json: Message.all
  end
end
