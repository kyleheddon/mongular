json.(@room, :name, :id)
json.messages @room.messages.asc(:created_at) do |json, message|
  json.(message, :content, :created_at)
  json.user message.user, :id, :name
end