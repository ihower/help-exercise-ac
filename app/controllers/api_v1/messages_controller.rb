class ApiV1::MessagesController < ApiController
  before_action :authenticate_user!

  def index
    @messages = Message.all
  end
end
