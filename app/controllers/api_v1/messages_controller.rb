class ApiV1::MessagesController < ApplicationController

  def index
    @message = Message.all
  end

end
