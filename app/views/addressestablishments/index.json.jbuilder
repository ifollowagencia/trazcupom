json.array!(@addressestablishments) do |addressestablishment|
  json.extract! addressestablishment, :id, :address, :establishment_id
  json.url addressestablishment_url(addressestablishment, format: :json)

  json.lat addressestablishment.latitude
  json.lng addressestablishment.longitude

  json.picture do
    json.url "http://localhost:3000/home/images/location_small.png"
    json.width 24
    json.height 32
  end

  json.infowindow "Hello!!!"
end