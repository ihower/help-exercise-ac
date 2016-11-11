json.data do
	json.messages @messages do |message|
		json.(message, :id, :status, :category_name, :title, :content, :created_at)
	end
end