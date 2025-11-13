
-- tabel mahasiswa -- nim , nama --
--tabel dosen -- nidn , nama_dosen --
--tabel matakuliah -- kode_mk , nama_mk --
--minggu depan quiz coyy--

create database kampus;
use kampus;



create table dosen(
    nidn char(5) primary key,
    nama_dosen varchar(50)
);


create table mahasiswa(
    nim char(5) primary key,
    nama varchar(50),
    nidn char(5),
    foreign key (nidn) references dosen(nidn)
);





insert into mahasiswa values
('10101', 'Agus', '20101'),
('10102', 'Budi', '20102'),
('10103', 'Cici', '20103');

insert into dosen values
('20101', 'Dr. Siti'),
('20102', 'Dr. Ani'),
('20103', 'Dr. Rina');

select a.nim, a.nama, b.nama_dosen from mahasiswa a inner join dosen b on a.nidn = b.nidn;


select * from mahasiswa;
select * from dosen;


create table matakuliah(
    kode_mk char(5) primary key,
    nama_mk varchar(50),
    nidn char(5),
    foreign key (nidn) references dosen(nidn)
);


insert into matakuliah values
('MK001', 'Basis Data', '20101'),
('MK002', 'Jaringan Komputer', '20102'),
('MK003', 'Pemrograman Web', '20103');


create table nilai(
    id_nilai int primary key auto_increment,
    nim char(5),
    kode_mk char(5),
    nilai_angka int,
    foreign key (nim) references mahasiswa(nim),
    foreign key (kode_mk) references matakuliah(kode_mk)
);


create table alumni(
    id_alumni int primary key auto_increment,
    nim char(5),
    tahun_lulus year,
    pekerjaan varchar(100),
    foreign key (nim) references mahasiswa(nim)
);

create table krs (
    id_krs int primary key auto_increment,
    nim char(5),
    kode_mk char(5),
    semester int,
    foreign key (nim) references mahasiswa(nim),
    foreign key (kode_mk) references matakuliah(kode_mk)
);

insert into krs values
(NULL, '10101', 'MK001', 1),
(NULL, '10101', 'MK002', 1),
(NULL, '10102', 'MK002', 1),
(NULL, '10102', 'MK003', 1);



select a.nim, a.nama, b.nama_mk, c.semester from mahasiswa a
left join krs c on a.nim = c.nim
left join matakuliah b on c.kode_mk = b.kode_mk;
