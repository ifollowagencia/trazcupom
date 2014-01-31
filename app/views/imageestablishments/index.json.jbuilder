json.array!(@imageestablishments) do |imageestablishment|
  json.extract! imageestablishment, :id, :image, :establishment_id
  json.url imageestablishment_url(imageestablishment, format: :json)
end
