class ApiV1::MessagesController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def index 
    @messages = Message.order("id DESC")
  end	
end
