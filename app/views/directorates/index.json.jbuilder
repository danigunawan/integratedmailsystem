json.array!(@directorates) do |directorate|
  json.extract! directorate, :id, :nama, :keterangan
  json.url directorate_url(directorate, format: :json)
end
