json.(@message, :content, :created_at)
json.user @message.user, :id, :name