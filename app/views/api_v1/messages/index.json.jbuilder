
json.data do
  json.array! @messages, :id, :status, :category_name, :title, :content, :created_at
end  