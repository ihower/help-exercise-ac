class ApiV1::MessagesController < ApplicationController
	def index
		@messages = Message.all
		render :json => @messages.order("id DESC").to_json(only: [:id, :status, :category_name, :title, :content, :created_at])
	
	end
end