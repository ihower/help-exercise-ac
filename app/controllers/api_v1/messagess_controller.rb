class ApiV1::TopicsController < ApiController


  def show
    @messages = Messages.find(params[:id])

  end




end
