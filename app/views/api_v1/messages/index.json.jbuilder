json.set! :code, "200"
json.set! :data do
  json.messages @messages.each do |m|
    json.id m.id
    json.status m.status
   json.category_name m.category_name
    json.title m.title
    json.content m.content
    json.created_at m.created_at
  end
end

#json.set! :data do
#  json.set! :messages, @messages
#end