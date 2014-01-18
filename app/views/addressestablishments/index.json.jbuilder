json.array!(@addressestablishments) do |addressestablishment|
  json.extract! addressestablishment, :id, :address, :latitude, :longitude, :establishment_id
  json.url addressestablishment_url(addressestablishment, format: :json)
end
