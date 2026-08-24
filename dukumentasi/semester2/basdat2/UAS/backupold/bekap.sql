-- viewdsddss
create or replace view view_laporan_pemesanan as
select
    p.kode_booking,
    pl.nama_pelanggan,
    p.nama_penumpang,
    ta.nama_terminal as terminal_asal,
    kt_asal.nama_kota as kota_asal,
    tt.nama_terminal as terminal_tujuan,
    kt_tujuan.nama_kota as kota_tujuan,
    o.nama_operator,
    b.nomor_polisi,
    j.waktu_berangkat,
    p.nomor_kursi,
    p.harga_bayar,
    p.metode_pembayaran,
    p.status_pembayaran,
    p.status_pemesanan
from pemesanan_tiket p
join pelanggan pl on p.id_pelanggan=pl.id_pelanggan
join jadwal_perjalanan j on p.id_jadwal=j.id_jadwal
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota kt_asal on ta.id_kota=kt_asal.id_kota
join kota kt_tujuan on tt.id_kota=kt_tujuan.id_kota
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator;

create or replace view view_pendapatan_operator as
select
    o.nama_operator,
    count(p.id_pemesanan) as jumlah_tiket_berhasil,
    sum(p.harga_bayar) as total_pendapatan,
    avg(p.harga_bayar) as rata_rata_harga
from operator_bus o
join bus b on o.id_operator=b.id_operator
join jadwal_perjalanan j on b.id_bus=j.id_bus
join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
where p.status_pembayaran='BERHASIL'
group by o.nama_operator;

create or replace view view_jadwal_pemesanan as
select
    j.id_jadwal,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    o.nama_operator,
    j.waktu_berangkat,
    j.harga_tiket,
    count(p.id_pemesanan) as jumlah_kursi_dipesan
from jadwal_perjalanan j
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator
left join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
group by j.id_jadwal,ta.nama_terminal,tt.nama_terminal,o.nama_operator,j.waktu_berangkat,j.harga_tiket;


--view
create or replace view v_jadwal_bus_lengkap as
select
    j.id_jadwal,
    o.nama_operator,
    b.nomor_polisi,
    b.jenis_bus,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    r.jarak_km,
    j.waktu_berangkat,
    j.waktu_tiba,
    j.harga_tiket,
    j.status_jadwal
from jadwal_perjalanan j
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator;

--view2
create or replace view v_detail_pemesanan as
select
    p.id_pemesanan,
    p.kode_booking,
    pl.nama_pelanggan,
    p.nama_penumpang,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    j.waktu_berangkat,
    p.nomor_kursi,
    p.harga_bayar,
    p.metode_pembayaran,
    p.status_pembayaran,
    p.status_pemesanan
from pemesanan_tiket p
join pelanggan pl on p.id_pelanggan=pl.id_pelanggan
join jadwal_perjalanan j on p.id_jadwal=j.id_jadwal
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal;

create or replace view v_pembayaran_lengkap as
select
    p.id_pemesanan,
    p.kode_booking,
    pl.nama_pelanggan,
    p.nama_penumpang,
    o.nama_operator,
    b.nomor_polisi,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    j.waktu_berangkat,
    p.harga_bayar,
    p.metode_pembayaran,
    p.status_pembayaran,
    p.tanggal_pemesanan
from pemesanan_tiket p
join pelanggan pl on p.id_pelanggan=pl.id_pelanggan
join jadwal_perjalanan j on p.id_jadwal=j.id_jadwal
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator;


create or replace view v_riwayat_pemesanan_pengguna as
select
    pl.id_pelanggan,
    pl.nama_pelanggan,
    p.kode_booking,
    p.nama_penumpang,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    j.waktu_berangkat,
    p.nomor_kursi,
    p.harga_bayar,
    p.status_pembayaran,
    p.status_pemesanan,
    p.tanggal_pemesanan
from pelanggan pl
join pemesanan_tiket p on pl.id_pelanggan=p.id_pelanggan
join jadwal_perjalanan j on p.id_jadwal=j.id_jadwal
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal;


create or replace view v_rute_terlaris as
select
    r.id_rute,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    count(p.id_pemesanan) as jumlah_pemesanan,
    sum(p.harga_bayar) as total_pendapatan
from rute r
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join jadwal_perjalanan j on r.id_rute=j.id_rute
join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
where p.status_pembayaran='BERHASIL'
group by r.id_rute,ta.nama_terminal,tt.nama_terminal;

--backup
grant select on kota to role_staff_loket;
grant select on terminal to role_staff_loket;
grant select on operator_bus to role_staff_loket;
grant select on bus to role_staff_loket;
grant select on rute to role_staff_loket;
grant select on jadwal_perjalanan to role_staff_loket;
grant select,insert on pelanggan to role_staff_loket;
grant select,insert on pemesanan_tiket to role_staff_loket;
grant update(status_pembayaran,status_pemesanan) on pemesanan_tiket to role_staff_loket;