class MessagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @messages = Message.includes(:user, :comments).order("id DESC").page( params[:page] )
    @messages = @messages.pending if params[:status] == "pending"
    @messages = @messages.completed if params[:status] == "completed"
    @messages = @messages.within_days(params[:days].to_i) if params[:days]
  end

  def show
    @message = Message.find( params[:id] )
    @comment = Comment.new
    @users_sub = @message.subed_by_users
    @users_liked = @message.liked_by_users
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
