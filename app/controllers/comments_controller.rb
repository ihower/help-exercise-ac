class CommentsController < ApplicationController

  before_action :set_message
  before_action :authenticate_user!

  def create
    @comment = @message.comments.build( comment_params )
    @comment.user = current_user

    @comment.save!

    redirect_to :back
  end

  def destroy
    @comment = current_user.comments.find( params[:id] )
    if @comment.user != current_user
      render :back, alert: "你不是作者，沒有權限！"
    else
      @comment.destroy
    end

    respond_to do |format|
      # format.html { redirect_to message_path(@message) }
      format.js 
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_message
    @message = Message.find( params[:message_id] )
  end

end
