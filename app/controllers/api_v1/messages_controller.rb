class ApiV1::MessagesController < ApiController

  # GET /api/v1/messages/:id
   def show
     @message = Message.find(params[:id])

     # show.json.jbuilder
   end

   # GET /api/v1/messages
   def index
     @messages = Message.page( params[:page] ).per(5)

     # index.json.jbuilder
   end

end
