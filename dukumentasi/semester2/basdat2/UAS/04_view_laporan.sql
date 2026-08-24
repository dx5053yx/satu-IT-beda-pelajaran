

-- view jadwal bus lengkap
create or replace view v_jadwal_bus_lengkap as
select
    j.id_jadwal,
    ka.nama_kota as kota_asal,
    kt.nama_kota as kota_tujuan,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    o.nama_operator,
    b.nomor_polisi,
    b.jenis_bus,
    b.kapasitas_kursi,
    r.jarak_km,
    j.waktu_berangkat,
    j.waktu_tiba,
    j.harga_tiket,
    j.status_jadwal
from jadwal_perjalanan j
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota ka on ta.id_kota=ka.id_kota
join kota kt on tt.id_kota=kt.id_kota
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator;


select *
from transportasi.v_jadwal_bus_lengkap
where kota_asal='Wonosobo'
and kota_tujuan='Purwokerto'
and status_jadwal='TERJADWAL';



-- view detail pemesanan berdasarkan pengguna
create or replace view v_detail_pemesanan as
select
    p.id_pemesanan,
    pl.id_pelanggan,
    pl.nama_pelanggan,
    p.kode_booking,
    p.nama_penumpang,
    ka.nama_kota as kota_asal,
    kt.nama_kota as kota_tujuan,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    o.nama_operator,
    j.waktu_berangkat,
    p.nomor_kursi,
    p.harga_bayar,
    p.status_pembayaran,
    p.status_pemesanan
from pemesanan_tiket p
join pelanggan pl on p.id_pelanggan=pl.id_pelanggan
join jadwal_perjalanan j on p.id_jadwal=j.id_jadwal
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota ka on ta.id_kota=ka.id_kota
join kota kt on tt.id_kota=kt.id_kota
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator;

select *
from transportasi.v_detail_pemesanan
where id_pelanggan=1;


-- view pembayaran lengkap hanya yang berhasil
create or replace view v_pembayaran_berhasil as
select
    p.id_pemesanan,
    pl.id_pelanggan,
    pl.nama_pelanggan,
    p.kode_booking,
    p.nama_penumpang,
    o.nama_operator,
    ka.nama_kota as kota_asal,
    kt.nama_kota as kota_tujuan,
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
join kota ka on ta.id_kota=ka.id_kota
join kota kt on tt.id_kota=kt.id_kota
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator
where p.status_pembayaran='BERHASIL';

select *
from transportasi.v_pembayaran_berhasil
where id_pelanggan=1;

-- view riwayat pemesanan pengguna
create or replace view v_riwayat_pemesanan_pengguna as
select
    pl.id_pelanggan,
    pl.nama_pelanggan,
    p.id_pemesanan,
    p.kode_booking,
    p.nama_penumpang,
    ka.nama_kota as kota_asal,
    kt.nama_kota as kota_tujuan,
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
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota ka on ta.id_kota=ka.id_kota
join kota kt on tt.id_kota=kt.id_kota;

select *
from transportasi.v_riwayat_pemesanan_pengguna
where id_pelanggan=1
order by tanggal_pemesanan desc;

-- view laporan pendapatan operator
create or replace view v_laporan_pendapatan_operator as
select
    o.id_operator,
    o.nama_operator,
    count(p.id_pemesanan) as jumlah_tiket_berhasil,
    sum(p.harga_bayar) as total_pendapatan,
    avg(p.harga_bayar) as rata_rata_harga
from operator_bus o
join bus b on o.id_operator=b.id_operator
join jadwal_perjalanan j on b.id_bus=j.id_bus
join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
where p.status_pembayaran='BERHASIL'
group by o.id_operator,o.nama_operator;

select *
from transportasi.v_laporan_pendapatan_operator
order by total_pendapatan desc;

-- view rute terlaris
create or replace view v_rute_terlaris as
select
    r.id_rute,
    ka.nama_kota as kota_asal,
    kt.nama_kota as kota_tujuan,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    count(p.id_pemesanan) as jumlah_tiket,
    sum(p.harga_bayar) as total_pendapatan
from rute r
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota ka on ta.id_kota=ka.id_kota
join kota kt on tt.id_kota=kt.id_kota
join jadwal_perjalanan j on r.id_rute=j.id_rute
join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
where p.status_pembayaran='BERHASIL'
group by r.id_rute,ka.nama_kota,kt.nama_kota,ta.nama_terminal,tt.nama_terminal;

select *
from transportasi.v_rute_terlaris
order by jumlah_tiket desc;

-- view jumlah kursi tersedia
create or replace view v_kursi_tersedia as
select
    j.id_jadwal,
    ka.nama_kota as kota_asal,
    kt.nama_kota as kota_tujuan,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    o.nama_operator,
    b.nomor_polisi,
    b.kapasitas_kursi,
    count(p.id_pemesanan) as jumlah_kursi_dipesan,
    b.kapasitas_kursi-count(p.id_pemesanan) as jumlah_kursi_tersedia,
    j.waktu_berangkat,
    j.status_jadwal
from jadwal_perjalanan j
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota ka on ta.id_kota=ka.id_kota
join kota kt on tt.id_kota=kt.id_kota
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator
left join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
and p.status_pemesanan<>'DIBATALKAN'
group by
    j.id_jadwal,
    ka.nama_kota,
    kt.nama_kota,
    ta.nama_terminal,
    tt.nama_terminal,
    o.nama_operator,
    b.nomor_polisi,
    b.kapasitas_kursi,
    j.waktu_berangkat,
    j.status_jadwal;

select *
from transportasi.v_kursi_tersedia
order by waktu_berangkat;
