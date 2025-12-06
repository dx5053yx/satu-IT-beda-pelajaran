create user 'akiru'@localhost identified by '311006';
grant all privileges on *.* to 'akiru'@localhost;
--pengetesan
/opt/lampp/bin/mysql -u akiru -p 311006
use order_entry;
insert into vendors (vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
values ('1008', 'amba', 'Jl. jalan-jalan. 10', 'uniga', 'NAH', '6969', 'Ohayo');
update vendors set vend_city='Bandung' where vend_id='1007';
delete from vendors where vend_id='1007';
--menghapus hak akses
revoke all privileges on order_entry.vendors from 'akiru'@localhost;
--pengetesan
/opt/lampp/bin/mysql -u akiru -p 311006
use order_entry;
insert into vendors (vend_id,vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
values ('10007', 'PT. Maju Terus', 'Jl. Merdeka No. 10', 'Bekasi', 'BKS', '11001', 'Indonesia');