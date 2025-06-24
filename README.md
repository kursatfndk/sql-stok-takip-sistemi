# SQL Server Stok Takip Sistemi

Bu proje, Microsoft SQL Server kullanılarak oluşturulmuş basit bir stok takip sistemidir. Ürün, stok, müşteri ve satış ilişkilerini yönetir. Satış yapıldığında, ilgili ürünün stok durumu otomatik olarak güncellenir.

## 🔧 Kullanılan Yapılar

- `tbl_urun`: Ürün ve hizmet bilgileri
- `tbl_stok`: Stoktaki ürünlerin takibi ve durumu
- `tbl_musteriler`: Müşteri bilgileri
- `tbl_satislar`: Satış ve deneme kayıtları
- `trg_stok_durum_guncelle`: Satış/deneme işlemlerinde stok durumunu otomatik günceller

## 📦 Kurulum

1. SQL Server Management Studio (SSMS) açın.
2. `db_stokTakip.sql` dosyasını çalıştırarak veritabanını ve tabloları oluşturun.
3. Excel verilerinizi `tbl_urun` tablosuna manuel veya import wizard ile ekleyin.

## 📌 Trigger Mantığı

Satış ya da deneme işlemi yapıldığında `tbl_satislar` tablosuna kayıt eklenir ve tetikleyici (trigger) stok tablosundaki `durum` alanını günceller:
sql
durum = 'satildi' veya 'deneme'
