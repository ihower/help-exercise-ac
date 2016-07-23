 json.data @messages do |m|
   json.id m.id
   json.status m.status
   if m.category_name
     json.category_name m.category_name
   else
     json.category_name 
   end
   json.title m.title
   json.content m.content
   json.created_at m.created_at
 end 