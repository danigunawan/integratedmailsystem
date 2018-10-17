json.array!(@roles) do |role|
  json.extract! role, :id, :nama, :keterangan
  json.url role_url(role, format: :json)
end
