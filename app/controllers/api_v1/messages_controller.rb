class ApiV1::MessagesController < ApiController

  def index
    # TODO: fix N+1 queries for user and comments
    @messages = Message.includes(:user,:comments).order("id DESC").page( params[:page] )

    if params[:status] == "pending"
      @messages = @messages.pending
    elsif params[:status] == "completed"
      @messages = @messages.completed
    end

    if params[:days]
      # TODO: @messages = @messages.within_days(params[:days].to_i)
      @messages = @messages.where( ["created_at >= ?", Time.now - params[:days].to_i.days ] )
    end
  end

end
