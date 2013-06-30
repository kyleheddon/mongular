json.array!(@rooms) do |room|
  json.extract! room, :name
end
