class ApiV1::TopicsController < ApiController


  def show
    @messages = Messages.all

  end




end
