create table history_pembelian(
id_pembelian varchar(5) not null,
id_penonton varchar(5),
id_tiket varchar(5),
jumlah_tiket int,
total_harga int,
primary key(id_pembelian)
);

create table history_pembelian as select * from pembelian where 1=2;

alter table history_pembelian add diedit_oleh varchar(50);
alter table history_pembelian add waktu_edit datetime;

delimiter //
create trigger catatan_pembelian
after delete on pembelian
for each row
begin
insert into history_pembelian
(id_pembelian,id_penonton,id_tiket,jumlah_tiket,total_harga, waktu_edit, diedit_oleh)
values
(old.id_pembelian, old.id_penonton, old.id_tiket, old.jumlah_tiket, old.total_harga,NOW(),CURRENT_USER);
end //
delimiter ;

delete from pembelian where id_pembelian = 'PM3';
select * from history_pembelian;

select
p.nama_penonton,
p.no_telefon,
b.jumlah_tiket,
b.total_harga
from pembelian b
join penonton p on b.id_penonton = p.id_penonton
join tiket t on b.id_tiket = t.id_tiket
where t.jenis_tiket = 'vip' and b.jumlah_tiket > 15;

select
p.nama_penonton,
p.no_telefon,
t.jenis_tiket,
b.jumlah_tiket,
t.harga,
b.total_harga
from pembelian b
join penonton p on b.id_penonton = p.id_penonton
join tiket t on b.id_tiket = t.id_tiket
where b.total_harga < 17000000;

create user 'admin'@'localhost' identified by 'admin';
grant insert on musikshow.penonton to 'admin'@'localhost';
flush privileges;

insert into penonton values('pn5','sujatmiko ara furi','086666666666');
alter table penonton delete 
select * from penonton;

revoke insert on musikshow.penonton from 'admin'@'localhost';
flush privileges;