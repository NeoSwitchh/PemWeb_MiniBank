DROP DATABASE minibank;
CREATE DATABASE minibank;
USE minibank;
CREATE TABLE konfigurasi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    code_value VARCHAR(50),
    created_by VARCHAR(50),
    edited_by VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    edited_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE nasabah (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(25),
    alamat VARCHAR(150),
    nik CHAR(12),
    jenis_kelamin TINYINT(1),
    created_by VARCHAR(50),
    edited_by VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    edited_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE rekening (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_nasabah INT,
    nomor_rekening CHAR(12),
    saldo INT,
    created_by VARCHAR(50),
    edited_by VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    edited_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_IdNasabah FOREIGN KEY (id_nasabah) REFERENCES nasabah(id)
);

CREATE TABLE transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_rekening INT,
    tgl_transaksi DATE,
    jenis_transaksi TINYINT(1),
    nominal INT,
    created_by VARCHAR(50),
    edited_by VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    edited_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_IdRekening FOREIGN KEY (id_rekening) REFERENCES rekening(id)
);