create table pelanggan(
    id_pelanggan char(5) not null PRIMARY KEY,
    nama_pelanggan varchar(25) NOT NULL,
    alamat varchar(30) NULL,
    pekerjaan varchar(20) NULL,
    no_ktp char(16) NULL,
    no_tlp char(13) NULL
);

create table nota_penjualan(
    id_nota char(5) not null PRIMARY KEY,
    tgl_nota date not null,
    total int not null,
    id_pelanggan char(5) not null,
    foreign key(id_pelanggan) references pelanggan(id_pelanggan)

);

create table barang(
    id_barang char(5) not null PRIMARY KEY,
    nama_barang varchar(25) NOT NULL,
    harga int NOT NULL,
    stok int NOT NULL
);

create table detail_jual(
    id_nota char(5) not null,
    id_barang char(5) not null,
    jumlah int NOT NULL,
    harga int NOT NULL,
    primary key(id_nota, id_barang),
    foreign key(id_nota) references nota_penjualan(id_nota),
    foreign key(id_barang) references barang(id_barang)
);