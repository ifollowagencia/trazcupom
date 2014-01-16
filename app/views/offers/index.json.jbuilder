json.array!(@offers) do |offer|
  json.extract! offer, :name, :description, :establishment_id, :product_id, :amount, :validity, :date, :image1, :image2, :image3, :image4, :status
  json.url offer_url(offer, format: :json)
end
