class ApiV1::MessagesController < ApiController

  def index
    @messages = Message.page( params[:page] )
  end


  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new( :title => params[:title],
                            :content => params[:content],
                            :category_name => params[:category_name],
                            :created_at => params[:created_at],
                            :status => params[:status])

    if @message.save
      render :json => [:id]
    else
      render :json => { :message => "failed", :errors => @message.errors }, :status => 400
    end
  end
end
