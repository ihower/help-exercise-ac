json.data @message do |x|
  json.id x.id
  json.status x.status
  json.category_name x.category_name
  json.title x.title
  json.content x.content
  json.created_at x.created_at
end