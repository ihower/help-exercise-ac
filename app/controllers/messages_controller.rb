class MessagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    # TODO: fix N+1 queries for user and comments
    @messages = Message.order("id DESC").page( params[:page] )

    if params[:status] == "pending"
      # TODO: @messages = @messages.pending
      @messages = @messages.where( :status => "pending" )
    elsif params[:status] == "completed"
      # TODO: @messages = @messages.completed
      @messages = @messages.where( :status => "completed" )
    end

    if params[:days]
      # TODO: @messages = @messages.within_days(params[:days].to_i)
      @messages = @messages.where( ["created_at >= ?", Time.now - params[:days].to_i.days ] )
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
    @message.user = user

    @message.save!

    redirect_to root_path
  end

  def edit
    @message = user.messages.find( params[:id] )

    render "new"
  end

  def update
    @message = user.messages.find( params[:id] )

    @message.update!( message_params )

    redirect_to message_path(@message)
  end

  def destroy
    @message = user.messages.find( params[:id] )
    @message.destroy

    redirect_to root_path
  end

  def subscribe
   @message = message.find( params[:id] )

   subscription = @message.finy_subscription_by(user)
   if subscription
     # do nothing
   else
     @subscription = @message.subscriptions.create!( :user => user )
   end

   redirect_to :back
 end

 def unsubscribe
   @message = message.find( params[:id] )

   subscription = @message.finy_subscription_by(user)
   subscription.destroy

   redirect_to :back
 end

  protected

  def message_params
    params.require(:message).permit(:title, :content, :category_name)
  end

end
