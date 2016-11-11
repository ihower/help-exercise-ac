json.data @messages do |msg|
  json.(msg, :id, :status, :category_name, :title, :content, :created_at)
end
