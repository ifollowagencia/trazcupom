json.array!(@commentestabs) do |commentestab|
  json.extract! commentestab, :id, :comment, :establishment_id, :user_id
  json.url commentestab_url(commentestab, format: :json)
end
