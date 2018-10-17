json.array!(@disposition_details) do |disposition_detail|
  json.extract! disposition_detail, :id, :nomor, :penerima, :status, :laporan, :tgl_laporan
  json.url disposition_detail_url(disposition_detail, format: :json)
end
