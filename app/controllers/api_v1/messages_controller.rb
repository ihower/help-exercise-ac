class ApiV1::MessagesController < ApiController
	def index
		@messages=Message.all.select( :id, :status, :category_name, :title, :content, :created_at )
		 # id, status, category_name, title, content 和 created_at。
		render :json =>  @messages
	end
end
