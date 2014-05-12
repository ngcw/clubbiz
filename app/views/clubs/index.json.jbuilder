json.array!(@clubs) do |club|
  json.extract! club, :id, :id, :name
  json.url club_url(club, format: :json)
end
