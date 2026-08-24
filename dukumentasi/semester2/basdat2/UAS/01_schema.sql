create table kota(
    id_kota number(10),
    nama_kota varchar2(100) not null,
    provinsi varchar2(100) not null,
    constraint pk_kota primary key(id_kota),
    constraint uq_kota unique(nama_kota,provinsi)
);

create table terminal(
    id_terminal number(10),
    id_kota number(10) not null,
    nama_terminal varchar2(100) not null,
    alamat varchar2(200),
    constraint pk_terminal primary key(id_terminal),
    constraint fk_terminal_kota foreign key(id_kota) references kota(id_kota),
    constraint uq_terminal unique(id_kota,nama_terminal)
);

create table operator_bus(
    id_operator number(10),
    nama_operator varchar2(100) not null,
    no_telepon varchar2(20),
    status_operator varchar2(20) not null,
    constraint pk_operator_bus primary key(id_operator),
    constraint uq_operator_bus_nama unique(nama_operator),
    constraint uq_operator_bus_telp unique(no_telepon),
    constraint ck_operator_bus_status check(status_operator in('AKTIF','NONAKTIF'))
);

create table bus(
    id_bus number(10),
    id_operator number(10) not null,
    nomor_polisi varchar2(20) not null,
    jenis_bus varchar2(20) not null,
    kapasitas_kursi number(3) not null,
    status_bus varchar2(20) not null,
    constraint pk_bus primary key(id_bus),
    constraint fk_bus_operator foreign key(id_operator) references operator_bus(id_operator),
    constraint uq_bus_nomor_polisi unique(nomor_polisi),
    constraint ck_bus_jenis check(jenis_bus in('EKONOMI','EKSEKUTIF')),
    constraint ck_bus_kapasitas check(kapasitas_kursi>0),
    constraint ck_bus_status check(status_bus in('AKTIF','PERAWATAN','NONAKTIF'))
);

create table rute(
    id_rute number(10),
    id_terminal_asal number(10) not null,
    id_terminal_tujuan number(10) not null,
    jarak_km number(6,2) not null,
    constraint pk_rute primary key(id_rute),
    constraint fk_rute_asal foreign key(id_terminal_asal) references terminal(id_terminal),
    constraint fk_rute_tujuan foreign key(id_terminal_tujuan) references terminal(id_terminal),
    constraint uq_rute_asal_tujuan unique(id_terminal_asal,id_terminal_tujuan),
    constraint ck_rute_terminal check(id_terminal_asal<>id_terminal_tujuan),
    constraint ck_rute_jarak check(jarak_km>0)
);

create table jadwal_perjalanan(
    id_jadwal number(10),
    id_rute number(10) not null,
    id_bus number(10) not null,
    waktu_berangkat date not null,
    waktu_tiba date not null,
    harga_tiket number(12,2) not null,
    status_jadwal varchar2(20) not null,
    constraint pk_jadwal_perjalanan primary key(id_jadwal),
    constraint fk_jadwal_rute foreign key(id_rute) references rute(id_rute),
    constraint fk_jadwal_bus foreign key(id_bus) references bus(id_bus),
    constraint ck_jadwal_waktu check(waktu_tiba>waktu_berangkat),
    constraint ck_jadwal_harga check(harga_tiket>0),
    constraint ck_jadwal_status check(status_jadwal in('TERJADWAL','BERANGKAT','SELESAI','DIBATALKAN'))
);

create table pelanggan(
    id_pelanggan number(10),
    nama_pelanggan varchar2(100) not null,
    no_hp varchar2(20) not null,
    email varchar2(100),
    constraint pk_pelanggan primary key(id_pelanggan),
    constraint uq_pelanggan_hp unique(no_hp),
    constraint uq_pelanggan_email unique(email)
);

create table pemesanan_tiket(
    id_pemesanan number(10),
    id_pelanggan number(10) not null,
    id_jadwal number(10) not null,
    kode_booking varchar2(20) not null,
    nama_penumpang varchar2(100) not null,
    nomor_kursi number(3) not null,
    harga_bayar number(12,2) not null,
    metode_pembayaran varchar2(20) not null,
    status_pembayaran varchar2(20) not null,
    status_pemesanan varchar2(20) not null,
    tanggal_pemesanan date default sysdate not null,
    constraint pk_pemesanan_tiket primary key(id_pemesanan),
    constraint fk_pemesanan_pelanggan foreign key(id_pelanggan) references pelanggan(id_pelanggan),
    constraint fk_pemesanan_jadwal foreign key(id_jadwal) references jadwal_perjalanan(id_jadwal),
    constraint uq_pemesanan_kode unique(kode_booking),
    constraint uq_pemesanan_kursi unique(id_jadwal,nomor_kursi),
    constraint ck_pemesanan_kursi check(nomor_kursi>0),
    constraint ck_pemesanan_harga check(harga_bayar>0),
    constraint ck_pemesanan_metode check(metode_pembayaran in('TRANSFER','QRIS','CASH')),
    constraint ck_pemesanan_status_bayar check(status_pembayaran in('MENUNGGU','BERHASIL','GAGAL')),
    constraint ck_pemesanan_status check(status_pemesanan in('DIPESAN','DIBATALKAN','SELESAI'))
);