----------admin----------------------
-- admin database bisa melihat daftar user
select username
from all_users
where username in('TRANSPORTASI','STAFF_LOKET','PENUMPANG001')
order by username;

-- admin database bisa melihat role yang sudah dibuat
select role
from dba_roles
where role in('ROLE_STAFF_LOKET','ROLE_PENUMPANG')
order by role;

-- admin database bisa melihat role yang diberikan ke user
select grantee, granted_role
from dba_role_privs
where grantee in('STAFF_LOKET','PENUMPANG001')
order by grantee;

-- admin database bisa membuat user baru untuk kebutuhan keamanan database
create user tes_admin identified by "3079";

-- admin database bisa menghapus user tersebut lagi
drop user tes_admin;



-----------owner---------------------------------------
-- owner database bisa melihat tabel miliknya sendiri
select *
from kota;

-- owner database bisa melihat data pemesanan
select *
from pemesanan_tiket;

-- owner database bisa membuat view
create or replace view v_test_owner as
select
    id_jadwal,
    waktu_berangkat,
    harga_tiket,
    status_jadwal
from jadwal_perjalanan;

-- owner database bisa select view yang dibuat sendiri
select *
from v_test_owner;

-- owner database bisa memberi akses view ke role lain
grant select on v_test_owner to role_staff_loket;

-- owner database bisa menghapus view test
drop view v_test_owner;

-- owner database TIDAKKK diberi hak membuat user baru
create user tes_owner identified by "3079";



--------------staff--------------------------
-- staff bisa melihat jadwal bus lengkap
select *
from transportasi.v_jadwal_bus_lengkap;

-- staff bisa melihat kursi tersedia
select *
from transportasi.v_kursi_tersedia;

-- staff bisa insert pelanggan
insert into transportasi.pelanggan
values(9005,'Tes Staff Loket1212','019219001','stafff1212001@mail.com');

-- staff bisa insert pemesanan tiket
insert into transportasi.pemesanan_tiket
values(9005,9005,1,'rb-staff-9001','Tes Staff Loket',90,85000,'QRIS','MENUNGGU','DIPESAN',sysdate);

-- staff bisa update status pembayaran dan status pemesanan
update transportasi.pemesanan_tiket
set status_pembayaran='BERHASIL',
    status_pemesanan='SELESAI'
where id_pemesanan=9005;

commit;



-- staff tidak boleh menghapus data bus
delete from transportasi.bus
where id_bus=1;


-- staff tidak boleh drop table
drop table transportasi.kota;


-----------penumpang------------------
-- penumpang bisa melihat jadwal bus
select *
from transportasi.v_jadwal_bus_lengkap;

-- penumpang bisa melihat detail pemesanan
select *
from transportasi.v_detail_pemesanan
where id_pelanggan=4;

-- penumpang bisa melihat pembayaran yang berhasil
select *
from transportasi.v_pembayaran_berhasil
where id_pelanggan=4;

-- penumpang bisa melihat riwayat pemesanan sendiri
select *
from transportasi.v_riwayat_pemesanan_pengguna
where id_pelanggan=4
order by tanggal_pemesanan desc;

-- penumpang bisa melihat jumlah kursi tersedia
select *
from transportasi.v_kursi_tersedia;

-- penumpang tidak boleh melihat laporan pendapatan operator
select *
from transportasi.v_laporan_pendapatan_operator;

-- penumpang tidak boleh melihat rute terlaris jika aksesnya sudah dicabut
select *
from transportasi.v_rute_terlaris;

-- penumpang tidak boleh melihat tabel asli pelanggan
select *
from transportasi.pelanggan;

-- penumpang tidak boleh menghapus data bus
delete from transportasi.bus
where id_bus=1;

-- penumpang tidak boleh drop table
drop table transportasi.kota;


