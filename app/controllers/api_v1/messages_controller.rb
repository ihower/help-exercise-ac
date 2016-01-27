
class ApiV1::MessagesController < ApiController

  # GET /api/v1/topics/:id
  def show
    @message = Message.find(params[:id])

    # show.json.jbuilder
  end

  # GET /api/v1/topics
  def index
    @messages = Message.page( params[:page] ).per(5)

    # index.json.jbuilder
  end

end