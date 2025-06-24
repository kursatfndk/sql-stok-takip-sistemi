CREATE DATABASE db_stokTakip;
GO
USE db_stokTakip;

CREATE TABLE tbl_urun 
(
    urun_id INT PRIMARY KEY IDENTITY(1,1),
    urun_hizm_adi VARCHAR(60),
    satis_fiyati SMALLMONEY,
    barkod VARCHAR(30),
    seriNo VARCHAR(20) UNIQUE
);
CREATE TABLE tbl_stok 
(
    stok_id INT PRIMARY KEY IDENTITY(1,1),
    urun_id INT FOREIGN KEY REFERENCES tbl_urun(urun_id),
    adet INT DEFAULT 1,
    durum VARCHAR(10) DEFAULT 'stokta' 
);
CREATE TABLE tbl_musteriler (
    musteri_id INT PRIMARY KEY IDENTITY(1,1),
    ad_soyad VARCHAR(60),
    tel_id VARCHAR(15),   
    tc CHAR(11) UNIQUE NOT NULL,
    adres VARCHAR(MAX)
);
CREATE TABLE tbl_satislar (
    satis_id INT PRIMARY KEY IDENTITY(1,1),
    urun_id INT FOREIGN KEY REFERENCES tbl_urun(urun_id),
    musteri_id INT FOREIGN KEY REFERENCES tbl_musteriler(musteri_id),
    tarih DATETIME DEFAULT GETDATE(),
    islem_turu VARCHAR(10), 
    aciklama VARCHAR(255)
);
GO

CREATE TRIGGER trg_stok_durum_guncelle
ON tbl_satislar
AFTER INSERT
AS
BEGIN
    UPDATE tbl_stok
    SET durum = (SELECT islem_turu FROM inserted)
    WHERE urun_id IN (SELECT urun_id FROM inserted);
END;
UPDATE tbl_stok
SET durum = 'stokta'
WHERE urun_id = 1; 
