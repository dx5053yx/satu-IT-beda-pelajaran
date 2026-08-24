--pk gagal
insert into kota
values(1,'Kota Dobel','Jawa Tengah');

--fk gagal
insert into terminal
values(999,999,'Terminal Salah','Alamat Salah');

--check gagal
insert into bus
values(999,1,'AA 9999 ZZ','EKONOMI',0,'AKTIF');

--status pembayaran gagal
insert into pemesanan_tiket
values(999,1,1,'rb-salah','Tes Salah',98,85000,'QRIS','LUNAS','DIPESAN',sysdate);

--kursi dobel gagal
insert into pemesanan_tiket
values(998,1,1,'rb-dobel','Tes Dobel',1,85000,'QRIS','BERHASIL','DIPESAN',sysdate);


-- 1. Mengecek PRIMARY KEY (Constraint: Identitas Ganda)
-- EKSEKUSI INI:
insert into kota(id_kota, nama_kota, provinsi) 
values(1, 'Magelang', 'Jawa Tengah');

-- HASIL YANG DIHARAPKAN: 
-- ORA-00001: unique constraint (PK_KOTA) violated.
-- Penjelasan: Sistem menolak karena id_kota 1 sudah terpakai.

-- 2. Mengecek FOREIGN KEY (Constraint: Data Induk Tidak Ditemukan)
-- EKSEKUSI INI:
insert into jadwal_perjalanan(id_jadwal, id_rute, id_bus, waktu_berangkat, waktu_tiba, harga_tiket, status_jadwal) 
values(999, 999, 1, to_date('2026-08-01 07:00','yyyy-mm-dd hh24:mi'), to_date('2026-08-01 10:00','yyyy-mm-dd hh24:mi'), 85000, 'TERJADWAL');

-- HASIL YANG DIHARAPKAN:
-- ORA-02291: integrity constraint (FK_JADWAL_RUTE) violated - parent key not found.
-- Penjelasan: Sistem menolak karena rute 999 tidak ada di tabel referensi rute.

-- 3. Mengecek UNIQUE (Constraint: Data Kembar / Double Booking)
-- EKSEKUSI INI:
insert into pemesanan_tiket(id_pemesanan, id_pelanggan, id_jadwal, kode_booking, nama_penumpang, nomor_kursi, harga_bayar, metode_pembayaran, status_pembayaran, status_pemesanan) 
values(9999, 2, 1, 'RB-9999', 'Siti Aminah', 1, 85000, 'QRIS', 'BERHASIL', 'DIPESAN');

-- HASIL YANG DIHARAPKAN:
-- ORA-00001: unique constraint (UQ_PEMESANAN_KURSI) violated.
-- Penjelasan: Sistem membatalkan transaksi karena mencegah overbooking (kursi 1 di jadwal 1 sudah ada yang punya).

-- 4. Mengecek CHECK Logika Waktu (Constraint: Mesin Waktu)
-- EKSEKUSI INI:
insert into jadwal_perjalanan(id_jadwal, id_rute, id_bus, waktu_berangkat, waktu_tiba, harga_tiket, status_jadwal) 
values(998, 1, 1, to_date('2026-08-01 10:00','yyyy-mm-dd hh24:mi'), to_date('2026-08-01 07:00','yyyy-mm-dd hh24:mi'), 85000, 'TERJADWAL');

-- HASIL YANG DIHARAPKAN:
-- ORA-02290: check constraint (CK_JADWAL_WAKTU) violated.
-- Penjelasan: Sistem menolak karena waktu tiba (jam 07:00) tidak mungkin lebih dulu dari waktu berangkat (jam 10:00).

-- 5. Mengecek CHECK Logika Lokasi (Constraint: Rute Berputar)
-- EKSEKUSI INI:
insert into rute(id_rute, id_terminal_asal, id_terminal_tujuan, jarak_km) 
values(997, 1, 1, 10);

-- HASIL YANG DIHARAPKAN:
-- ORA-02290: check constraint (CK_RUTE_TERMINAL) violated.
-- Penjelasan: Sistem menolak karena terminal asal tidak boleh sama dengan terminal tujuan.

-- 6. Mengecek CHECK Validasi Teks (Constraint: Salah Ejaan)
-- EKSEKUSI INI:
insert into bus(id_bus, id_operator, nomor_polisi, jenis_bus, kapasitas_kursi, status_bus) 
values(996, 1, 'AA 1234 BB', 'VIP', 40, 'AKTIF');

-- HASIL YANG DIHARAPKAN:
-- ORA-02290: check constraint (CK_BUS_JENIS) violated.
-- Penjelasan: Sistem menolak karena 'VIP' tidak ada dalam daftar yang diizinkan (IN ('EKONOMI','EKSEKUTIF')).