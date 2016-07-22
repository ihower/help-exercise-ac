json.data @messages do |msg|

  json.id msg.id
  json.status msg.status
  json.category_name msg.category_name
  json.title msg.title
  json.content msg.content
  json.created_at msg.created_at

end



