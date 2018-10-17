json.array!(@letters) do |letter|
  json.extract! letter, :id, :no_surat, :sifat, :jenis, :pengirim, :penerima, :asal_surat, :perihal, :tgl_surat, :tgl_terima, :cost_centre_id, :directorate_id, :nama_file, :status, :delegasi
  json.url letter_url(letter, format: :json)
end
