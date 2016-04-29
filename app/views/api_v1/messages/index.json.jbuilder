json.results do
  json.array!(@messages) do |m|
    json.partial! 'message', message: m
  end
end
