json.data @massages do |massage|
  json.(massage, :id, :status, :category_name, :title, :content, :created_at)
end