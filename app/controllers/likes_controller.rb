class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    like = @message.finy_like_by(current_user)
    if like
      # do nothing
    else
      @message.likes.create!(:user => current_user)
    end

    redirect_to :back
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy

    redirect_to :back
  end

  protected

  def set_message
    @message =  Message.find(params[:message_id])
  end

end
