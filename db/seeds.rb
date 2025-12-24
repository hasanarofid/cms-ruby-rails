# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Seed User Admin
User.find_or_create_by!(username: "admin") do |u|
  u.password = "admin123"
end

# Seed Kasur
k1 = Kasur.find_or_create_by!(nama: "Kasur Busa Single") do |k|
  k.deskripsi = "Kasur busa ukuran 90x200 cm, nyaman dan ekonomis."
  k.harga_per_hari = 15000
  k.status = "Tersedia"
end

k2 = Kasur.find_or_create_by!(nama: "Kasur Springbed Queen") do |k|
  k.deskripsi = "Springbed berkualitas ukuran 160x200 cm."
  k.harga_per_hari = 35000
  k.status = "Tersedia"
end

# Seed Penyewa
p1 = Penyewa.find_or_create_by!(nama: "Budi Santoso") do |p|
  p.alamat = "Jl. Merdeka No. 10, Malang"
  p.nomor_telepon = "08123456789"
  p.identitas = "3507123456780001"
end

# Seed Sewa
Sewa.find_or_create_by!(kasur: k1, penyewa: p1) do |s|
  s.tanggal_mulai = Date.today
  s.tanggal_selesai = Date.today + 3.days
  s.total_harga = k1.harga_per_hari * 3
  s.status = "Aktif"
end

puts "Seed data created successfully!"
