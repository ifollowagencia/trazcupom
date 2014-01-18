json.array!(@likeestablishments) do |likeestablishment|
  json.extract! likeestablishment, :id, :count, :establishment_id
  json.url likeestablishment_url(likeestablishment, format: :json)
end
