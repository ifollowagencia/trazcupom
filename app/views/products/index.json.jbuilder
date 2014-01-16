json.array!(@products) do |product|
  json.extract! product, :name, :description, :price, :establishment_id
  json.url product_url(product, format: :json)
end
