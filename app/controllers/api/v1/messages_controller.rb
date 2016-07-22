class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.all

    respond_to do |format|
      format.html
      format.js
    end
  end
end
