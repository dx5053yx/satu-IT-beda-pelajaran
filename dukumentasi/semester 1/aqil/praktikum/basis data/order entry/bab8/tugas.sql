--left join
select a.cust_name, b.order_date from customers a left join orders b on a.cust_id=b.cust_id;
select a.prod_name, b.quantity from products a left join orderitems b on a.prod_id=b.prod_id;

--right join
select a.prod_name, b.quantity from products a right join orderitems b on a.prod_id=b.prod_id;
--self join
select a.cust_name, b.cust_city from customers a inner join customers b on a.cust_id=b.cust_id;
select a.vend_name, b.vend_state, 'negaranya' , b.vend_country from vendors a inner join vendors b on a.vend_id=b.vend_id;
--join 3 table 
select a.cust_name, b.order_date, c.quantity from customers a join orders b on a.cust_id=b.cust_id join orderitems c on b.order_num=c.order_num;
--cross join
select a.cust_name, b.vend_name from customers a cross join vendors b;
--union
select cust_name from customers where cust_city='New York' union select cust_name from customers where cust_city='Los Angeles';
--intersect
select cust_name from customers where cust_city='New York' intersect select cust_name from customers where cust_contact='John Doe';
--except
select cust_name from customers where cust_city='New York' except select cust_name from customers where cust_contact='John Doe';
--view
create view infokan as select cust_name, cust_contact, cust_email from customers where cust_city='Muncie';
select * from infokan;
--delete view
drop view infokan;

--trigger
create table customers_backup as select * from customers where 1=2;
--MENAMBAHKAN KOLOM USERNAME UNTUK PENGUBAH PADA TABEL customers_backup
alter table customers_backup add username varchar(30);
--trigger
DELIMITER $$

CREATE TRIGGER customers_backup AFTER DELETE
ON customers FOR EACH ROW
BEGIN
    INSERT INTO customers_backup
    (
        cust_id,
        cust_name,
        cust_address,
        cust_city,
        cust_state,
        cust_zip,
        cust_country,
        cust_contact,
        cust_email,
        deleted_date, 
        username
    )
    VALUES
    (
        old.cust_id,
        old.cust_name,
        old.cust_address,
        old.cust_city,
        old.cust_state,
        old.cust_zip,
        old.cust_country,
        old.cust_contact,
        old.cust_email,
        NOW(), 
        CURRENT_USER
    );
END$$
DELIMITER ;


--test trigger
--hapus data yang berhubungan dengan cust_id '10004' pada tabel orders dan orderitems terlebih dahulu
delete from orderitems where order_num in (select order_num from orders where cust_id='10004');
delete from orders where cust_id='10004';
delete from customers where cust_id='10004';
--view untuk melihat isi tabel customers_backup
select * from customers_backup;