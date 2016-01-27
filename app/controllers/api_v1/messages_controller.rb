class ApiV1::MessagesController < ApiController

  def index
    @messages = Message.page(params[:page]).per(10)
  end
end
