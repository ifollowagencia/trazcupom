json.array!(@addressestablishments) do |addressestablishment|
  json.extract! addressestablishment, :id, :address, :establishment_id
  json.url addressestablishment_url(addressestablishment, format: :json)

  json.lat addressestablishment.latitude
  json.lng addressestablishment.longitude

  json.picture do
    json.url "http://localhost:3000/home/images/location.png"
    json.width 150
    json.height 150
  end

  json.infowindow "Hello!!!"
end