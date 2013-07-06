json.array!(@messages) do |message|
  json.extract! message, :content, :updated_at
  json.user message.user, :name, :id
end
