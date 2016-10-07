json.array! @messages do |message|
	json.(message, :id)

	json.detalis do 
		json.partial! message
	end
end