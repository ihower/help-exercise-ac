json.metadata do
  json.total Message.count
end

json.data @messages do |m|
  json.id m.id
  json.status m.status
  json.category_name m.category_name
  json.title m.title
  json.content m.content
  json.created_at m.created_at
end