json.meta do
  json.current_page @messages.current_page
  json.total_pages @messages.total_pages
  json.per_page @messages.limit_value
  json.next_url (@messages.last_page?)? nil : v1_messages_url( :page => @messages.next_page )
  json.previous_url (@messages.first_page?)? nil v1_messages_url( :page => @messages.prev_page )
end

json.results do
  json.array!(@messages) do |message|
    json.partial! 'message', message: message
  end
end
