json.array!(@club_announcements) do |club_announcement|
  json.extract! club_announcement, :id, :content, :club_id, :user_id
  json.url club_announcement_url(club_announcement, format: :json)
end
