CREATE USER transportasi IDENTIFIED BY "password";
GRANT CREATE SESSION TO transportasi;
GRANT CREATE TABLE TO transportasi;
GRANT CREATE VIEW TO transportasi;
GRANT CREATE SEQUENCE TO transportasi;
GRANT CREATE TRIGGER TO transportasi;
GRANT CREATE PROCEDURE TO transportasi;

grant select on v_jadwal_bus_lengkap to role_penumpang;
grant select on v_detail_pemesanan to role_penumpang;
grant select on v_pembayaran_berhasil to role_penumpang;
grant select on v_riwayat_pemesanan_pengguna to role_penumpang;
grant select on v_kursi_tersedia to role_penumpang;

grant select on kota to role_staff_loket;
grant select on terminal to role_staff_loket;
grant select on operator_bus to role_staff_loket;
grant select on bus to role_staff_loket;
grant select on rute to role_staff_loket;
grant select on jadwal_perjalanan to role_staff_loket;
grant select,insert on pelanggan to role_staff_loket;
grant select,insert on pemesanan_tiket to role_staff_loket;
grant update(status_pembayaran,status_pemesanan) on pemesanan_tiket to role_staff_loket;

grant select on v_jadwal_bus_lengkap to role_staff_loket;
grant select on v_detail_pemesanan to role_staff_loket;
grant select on v_pembayaran_berhasil to role_staff_loket;
grant select on v_riwayat_pemesanan_pengguna to role_staff_loket;
grant select on v_kursi_tersedia to role_staff_loket;
grant select on v_laporan_pendapatan_operator to role_staff_loket;
grant select on v_rute_terlaris to role_staff_loket;
