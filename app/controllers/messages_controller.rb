class MessagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    # TODO: fix N+1 queries for user and comments
    # use "includes"
    @messages = Message.includes(:user => :comments).order("id DESC").page( params[:page] )

    if params[:status] == "pending"
      @messages = @messages.pending
      # @messages = @messages.where( :status => "pending" )
    elsif params[:status] == "completed"
      @messages = @messages.completed
      # @messages = @messages.where( :status => "completed" )
    end

    if params[:days]
      @messages = @messages.within_days(params[:days].to_i)
      # @messages = @messages.where( ["created_at >= ?", Time.now - params[:days].to_i.days ] )
    end

    respond_to do |format|
      format.html
      format.json {
        arr = @messages.map { |m|
          { id: m.id,
            stauts: m.status,
            category_name: m.category_name,
            title: m.title,
            user_id: m.user_id,
            display_name: m.user.display_name,
            content: m.content,
            created_at: m.created_at
          }
        }
        render json: {data: arr}
      }

    end
  end

  def show
    @message = Message.find( params[:id] )
    @comment = Comment.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new( message_params )
    @message.user = current_user

    @message.save!

    redirect_to root_path
  end

  def edit
    @message = current_user.messages.find( params[:id] )

    render "new"
  end

  def update
    @message = current_user.messages.find( params[:id] )

    @message.update!( message_params )

    redirect_to message_path(@message)
  end

  def destroy
    @message = current_user.messages.find( params[:id] )
    @message.destroy

    redirect_to root_path
  end

  protected

  def message_params
    params.require(:message).permit(:title, :content, :category_name)
  end

end
