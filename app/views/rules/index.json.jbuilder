json.array!(@rules) do |rule|
  json.extract! rule, :description, :offer_id
  json.url rule_url(rule, format: :json)
end
