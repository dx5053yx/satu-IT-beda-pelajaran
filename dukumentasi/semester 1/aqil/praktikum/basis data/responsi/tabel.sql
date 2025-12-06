create table penonton(
id_penonton char(3) not null,
nama_penonton varchar(50),
no_telefon varchar(20),
primary key(id_penonton)
);

create table tiket(
id_tiket char(3) not null,
jenis_tiket varchar(20),
harga int,
primary key(id_tiket)
);

create table pembelian(
id_pembelian char(3) not null,
id_penonton char(3),
id_tiket char(3),
jumlah_tiket int,
total_harga int,
primary key(id_pembelian),
foreign key(id_penonton) references penonton(id_penonton),
foreign key(id_tiket) references tiket(id_tiket)
);