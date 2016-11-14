json.All_messages do
  json.array!(@messages) do |message|
    json.extract! message,  :id, :status, :category_name, :title, :content, :created_at
  end
end