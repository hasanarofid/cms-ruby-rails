# Dokumentasi Deploy Sewa Kasur Admin (Ruby on Rails) di cPanel

Aplikasi ini menggunakan Ruby on Rails 8 dengan database MySQL. Berikut adalah panduan langkah demi langkah untuk melakukan deploy di cPanel.

## 1. Persiapan Database (MySQL)
1. Login ke cPanel.
2. Buka **MySQL® Databases**.
3. Buat database baru: `sewakasur_production`.
4. Buat user database baru dan hubungkan ke database tersebut dengan hak akses **ALL PRIVILEGES**.
5. Catat **Database Name**, **Username**, dan **Password**.

## 2. Setup Ruby di cPanel
1. Cari menu **Setup Ruby App** di cPanel.
2. Klik **Create Application**.
3. **Ruby Version**: Pilih versi 3.x (minimal 3.0).
4. **App Directory**: Masukkan folder tempat Anda menyimpan file (misal: `sewakasur`).
5. **App Domain/URL**: Pilih domain Anda.
6. **Application Entry Point**: Masukkan `config.ru`.
7. **Run Setup Scripts**: Pastikan ini aktif.
8. Klik **Create**.

## 3. Konfigurasi Environment & Database
Setelah aplikasi dibuat, Anda akan diberikan perintah untuk masuk ke virtual environment (misal: `source /home/user/rubyvenv/sewakasur/3.0/bin/activate`). Jalankan perintah tersebut di Terminal cPanel.

### Edit `config/database.yml`
Pastikan bagian `production` di isi dengan kredensial yang Anda buat tadi:
```yaml
production:
  adapter: mysql2
  encoding: utf8mb4
  pool: 5
  database: sewakasur_production
  username: username_anda
  password: password_anda
  host: localhost
```

### Tambahkan Environment Variables
Di menu **Setup Ruby App**, tambahkan variabel:
- `RAILS_ENV`: `production`
- `RAILS_MASTER_KEY`: (Dapatkan isinya dari file `config/master.key` di folder proyek Anda)
- `RAILS_SERVE_STATIC_FILES`: `true`

## 4. Instalasi Gems & Migrasi
Buka **Terminal** di cPanel dan jalankan perintah berikut di dalam folder aplikasi:

```bash
# Instal dependencies
bundle install

# Precompile assets (CSS/JS)
RAILS_ENV=production bundle exec rake assets:precompile

# Migrasi Database
RAILS_ENV=production bundle exec rake db:migrate

# Seed Data (Opsional)
RAILS_ENV=production bundle exec rake db:seed
```

## 5. Restart Aplikasi
Setelah semua selesai, kembali ke menu **Setup Ruby App** dan klik tombol **Restart**.

---

## Tips PWA
Aplikasi ini sudah mendukung PWA. Untuk hasil terbaik:
- Pastikan domain Anda menggunakan **HTTPS/SSL**.
- Ikon aplikasi dapat diubah di `public/icon.png`.
- Nama aplikasi dapat diubah di `app/views/pwa/manifest.json.erb`.

---
*Dibuat oleh AI Assistant untuk hasanarofid*

