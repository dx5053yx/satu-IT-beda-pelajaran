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
    p.status_pembayaran
from pemesanan_tiket p
join pelanggan pl on p.id_pelanggan=pl.id_pelanggan
join jadwal_perjalanan j on p.id_jadwal=j.id_jadwal
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join kota kt_asal on ta.id_kota=kt_asal.id_kota
join kota kt_tujuan on tt.id_kota=kt_tujuan.id_kota
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator
order by p.id_pemesanan;

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
group by o.nama_operator
order by total_pendapatan desc;

select
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    count(j.id_jadwal) as jumlah_jadwal,
    count(p.id_pemesanan) as jumlah_tiket,
    sum(p.harga_bayar) as total_pendapatan
from rute r
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join jadwal_perjalanan j on r.id_rute=j.id_rute
left join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
group by ta.nama_terminal,tt.nama_terminal
order by jumlah_tiket desc;

select
    j.id_jadwal,
    ta.nama_terminal as terminal_asal,
    tt.nama_terminal as terminal_tujuan,
    o.nama_operator,
    j.waktu_berangkat,
    count(p.id_pemesanan) as jumlah_kursi_dipesan
from jadwal_perjalanan j
join rute r on j.id_rute=r.id_rute
join terminal ta on r.id_terminal_asal=ta.id_terminal
join terminal tt on r.id_terminal_tujuan=tt.id_terminal
join bus b on j.id_bus=b.id_bus
join operator_bus o on b.id_operator=o.id_operator
left join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
group by j.id_jadwal,ta.nama_terminal,tt.nama_terminal,o.nama_operator,j.waktu_berangkat
order by j.id_jadwal;

select
    id_jadwal,
    waktu_berangkat,
    harga_tiket
from jadwal_perjalanan
where harga_tiket>(
    select avg(harga_tiket)
    from jadwal_perjalanan
)
order by harga_tiket desc;

select
    o.nama_operator,
    sum(p.harga_bayar) as total_pendapatan
from operator_bus o
join bus b on o.id_operator=b.id_operator
join jadwal_perjalanan j on b.id_bus=j.id_bus
join pemesanan_tiket p on j.id_jadwal=p.id_jadwal
where p.status_pembayaran='BERHASIL'
group by o.nama_operator
having sum(p.harga_bayar)>100000
order by total_pendapatan desc;