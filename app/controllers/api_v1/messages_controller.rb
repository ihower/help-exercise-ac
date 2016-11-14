class ApiV1::MessagesController < ActionController::Base

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @messages = Message.all
  end
end