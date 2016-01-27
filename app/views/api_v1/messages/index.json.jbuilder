
json.data do 
	json.array! (@messages) do |m|
  json.id m.id
  json.status m.status
  json.category_name m.category_name
  json.title m.title
  json.content m.content
  json.created_at m.created_at


  end


end