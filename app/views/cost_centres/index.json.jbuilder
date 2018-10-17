json.array!(@cost_centres) do |cost_centre|
  json.extract! cost_centre, :id, :nama
  json.url cost_centre_url(cost_centre, format: :json)
end
