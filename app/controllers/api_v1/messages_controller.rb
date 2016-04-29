class ApiV1::MessagesController < ApiController
  def index
    @message = Message.all
  end
end