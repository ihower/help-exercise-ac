json.data @messages do |event|
  json.partial! "show", collection: @messages, :as => :messages
end