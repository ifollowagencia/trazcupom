json.array!(@catches) do |catch|
  json.extract! catch, :dateinit, :dateend, :offer_id
  json.url catch_url(catch, format: :json)
end
