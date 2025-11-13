select * from costomers order by cust_name asc;
select ,vend_country from vendors order by vend_country asc;

select count(vend_id), count(vend_name), count(vend_address), cont(vend_city), cout(vend_state), cout(vend_zip), cout(vend_country) from vendors;
select order_item, quantity from orderitems order by order_item desc; 
select order_item, quantity from orderitems order by quantity desc;
select max(quantity) from orderitems order by order_item;


select count(quantity), sum(quantity), avg(quantity), max(quantity), min(quantity) from orderitems;


select * from orderitems where quantity between 5 and 10 order by quantity asc;

select * from vendors where vend_country in ('USA');

select * from vendors where vend_name like '%p%',
select * from products where prod_name like '%p%';
select vend_name,prod_name from vendors,products like '%p%';

select prod_name as 'nama produk', prod_price as 'harga produk' from products;

select current_date as 'tahun sekarang', date '2006-10-31' as 'tahun lahir saya';
select current_time as 'waktu sekarang', time '09:00:00' as 'mulai praktium';


select time '20:22:25' - time '09:00:00';
select date '2025-10-24' - date '2006-10-31';