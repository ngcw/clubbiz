json.array!(@events) do |event|
  json.extract! event, :id, :name, :memberOnly, :date, :place, :price, :website, :imagePath, :bannerPath, :salesLocation
  json.url event_url(event, format: :json)
end
