class ApiV1::MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
end
