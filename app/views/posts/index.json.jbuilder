json.array!(@posts) do |post|
  json.extract! post, :id, :contents, :user_id, :discussion_id
  json.url post_url(post, format: :json)
end
