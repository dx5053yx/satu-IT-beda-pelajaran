create database akademik;
use akademik;

create table mahasiswa(
    nim char(5) primary key,
    nama varchar(50),
    prodi varchar(50)
);

desc mahasiswa; 

create table matakuliah(
    kode_mk char(5) primary key,
    nama_mk varchar(50)
);

desc matakuliah;

create table krs(
    id char(5) primary key,
    nim char(5),
    kode_mk char(5),
    ipk float,
    semester int,
    foreign key (nim) references mahasiswa(nim),
    foreign key (kode_mk) references matakuliah(kode_mk)
);

desc krs;


insert into mahasiswa values
('10101', 'Agus', 'Informatika'),
('10102', 'Budi', 'Sistem Informasi'),
('10103', 'Cici', 'Teknik Komputer'),
('10104', 'Dedi', 'Informatika'),
('10105', 'Eka', 'Sistem Informasi');

select * from mahasiswa;

insert into matakuliah values
('MK001', 'Basis Data'),
('MK002', 'Jaringan Komputer'),
('MK003', 'Pemrograman Web'),
('MK004', 'Sistem Operasi');

select * from matakuliah;

insert into krs values
('KRS01', '10101', 'MK001', 3.5, 1),
('KRS02', '10101', 'MK002', 3.0, 1),
('KRS03', '10102', 'MK001', 2.5, 1),
('KRS04', '10103', 'MK003', 3.8, 1),
('KRS05', '10104', 'MK002', 3.2, 1),
('KRS06', '10105', 'MK001', 2.8, 1);

select * from krs;

select a.nim, a.nama, max(b.ipk) as ipk_tertinggi from mahasiswa a, krs b where a.nim = b.nim;

select count(a.prodi) as jumlah_mahasiswa, a.prodi from mahasiswa a group by a.prodi;

select a.nim, a.nama, b.kode_mk, c.nama_mk 
from mahasiswa a, krs b, matakuliah c
where a.nim = b.nim and b.kode_mk = c.kode_mk and c.nama_mk = 'basis data';

create view nilaiA as
select a.nim, a.nama, b.ipk
from mahasiswa a, krs b
where a.nim = b.nim and b.ipk > 3.5;

select * from nilaiA;