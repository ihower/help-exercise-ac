class ApiV1::MessagesController < ApiController

  def index
    @messages = Message.order("id DESC").page( params[:id] )
  end

end
