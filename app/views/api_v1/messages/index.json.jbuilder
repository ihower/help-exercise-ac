json.results do
  json.array!(@messages) do |m|
    json.partial! 'msg', m: m
  end
end
