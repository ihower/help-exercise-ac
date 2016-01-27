class ApiV1::MessagesController < ApiController


 def index
     @messages = Message.page( params[:page] ).per(5)
 end

end
