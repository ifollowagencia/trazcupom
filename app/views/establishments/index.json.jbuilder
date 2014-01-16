json.array!(@establishments) do |establishment|
  json.extract! establishment, :name, :surname, :phone, :email, :password, :cnpj, :reason, :city_id, :plan_id, :imageprofile
  json.url establishment_url(establishment, format: :json)
end
