json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :topic, :description, :event_id
  json.url discussion_url(discussion, format: :json)
end
