class ApiV1::MessagesController < ApiController
  def messages
  
    render :json => Message.all
  end 
end
