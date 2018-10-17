json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :nama, :keterangan
  json.url attribute_url(attribute, format: :json)
end
