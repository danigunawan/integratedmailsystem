json.array!(@dispositions) do |disposition|
  json.extract! disposition, :id, :nomor, :letter_id, :instruksi, :tgl, :status, :laporan, :penerima, :pemberi, :cost_centre_pemberi_id, :cost_centre_penerima_id
  json.url disposition_url(disposition, format: :json)
end
