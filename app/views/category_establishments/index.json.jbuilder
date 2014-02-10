json.array!(@categoryestablishments) do |categoryestablishment|
  json.extract! categoryestablishment, :id, :name
  json.url categoryestablishment_url(categoryestablishment, format: :json)
end
