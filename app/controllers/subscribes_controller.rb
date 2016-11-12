class SubscribesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @subscribe = current_user.subscribes.build(:message_id => params[:message_id])
    @subscribe.save
    
    redirect_to message_path(@message) 
  end

  def destroy
    @subscribe = current_user.subscribes.find_by_message_id(params[:message_id])
    @subscribe.destroy
    
    redirect_to message_path(@message) 
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end

end