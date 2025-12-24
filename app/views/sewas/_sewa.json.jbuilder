json.extract! sewa, :id, :kasur_id, :penyewa_id, :tanggal_mulai, :tanggal_selesai, :total_harga, :status, :created_at, :updated_at
json.url sewa_url(sewa, format: :json)
