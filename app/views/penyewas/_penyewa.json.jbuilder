json.extract! penyewa, :id, :nama, :alamat, :nomor_telepon, :identitas, :created_at, :updated_at
json.url penyewa_url(penyewa, format: :json)
