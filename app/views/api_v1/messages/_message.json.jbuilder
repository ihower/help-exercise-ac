json.id message.id
json.status message.status
json.category_name message.category_name
json.title message.title
json.content message.content

json.user do
  json.id message.user_id
  json.name message.user.try(:display_name)
end


json.created_at message.created_at
