json.array!(@notes) do |note|
  json.extract! note, :description, :offer_id
  json.url note_url(note, format: :json)
end
