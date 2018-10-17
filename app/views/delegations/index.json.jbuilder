json.array!(@delegations) do |delegation|
  json.extract! delegation, :id, :nomor, :mulai, :selesai, :pemberi, :cost_centre_pemberi_id, :penerima, :cost_centre_penerima_id, :keterangan
  json.url delegation_url(delegation, format: :json)
end
