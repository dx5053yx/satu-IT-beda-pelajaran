insert into customers (cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email) values
('10002', 'House House', '333 Fromage Lane', 'Columbus', 'OH', '43333', 'USA', 'Jerry Mouse', NULL),
('10003', 'Wascals', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com'),
('10004', 'Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y San', 'san@yosemite.com'),
('10005', 'E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd', NULL);



insert into vendors (vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country) values
('1001', 'Anvils R Us', '123 Main Street', 'Southfield', 'MI', '48075', 'USA'),
('1002', 'LT Supplies', '500 Park Street', 'Any Town', 'OH', '48033', 'USA'),
('1003', 'ACME', '555 High Street', 'Los Angeles', 'CA', '90046', 'USA'),
('1004', 'Furball, Inc.', '1000 5th Avenue', 'New York', 'NY', '1111', 'USA'),
('1005', 'Jet Set', '42 Galaxy Road', 'London', NULL, 'N16 6PS', 'England'),
('1006', 'Jouets Et Ours', '1 Rue Amusement', 'Paris', NULL, '45678', 'France');



insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) values
('ANV01',1001,'.5 ton anvil',6,".5 ton anvil, black, complete with handy hook"),
('ANV02',1001,'1 ton anvil',10,"1 ton anvil, black, complete with handy hook and carrying case"),
('ANV03',1001,'2 ton anvil',15,"2 ton anvil, black, complete with handy hook and carrying case"),
('DTNTR',1003,'Detonator',10,"Detonator (plunger powered), fuses not included"),
('FB',1003,'Bird seed',3,'Large bag (suitable for road runners)'),
('FC',1003,'Carrots',3,'Carrots (rabbit hunting season only)'),
('FU1',1002,'Fuses',35,"1 dozen, extra long"),
('JP1000',1005,'JetPack 1000',55,"JetPack 1000, intended for single use"),
('JP2000',1005,'JetPack 2000',9,"JetPack 2000, multi-use"),
('OL1',1002,'Oil can',50,"Oil can, red"),
('SAFE',1003,'Safe',4,'Safe with combination lock'),
('SLING',1003,'Sling',3,"Sling, one size fits all"),
('TNT1',1003,'TNT (1 stick)',3,"TNT, red, single stick"),
('TNT2',1003,'TNT (5 sticks)',10,"TNT, red, pack of 10 sticks");



insert into productnotes (note_id,prod_id,note_date,note_text) values
('001','ANV01','2010-09-17','terbayar'),
('002','FB','2017-11-19','terbayar'),
('003','SAFE','2021-07-22','terbayar');


insert into orders (order_num,order_date,cust_id) values
(20005,'2005-09-01',10002),
(20006,'2005-09-28',10002),
(20007,'2005-09-30',10004),
(20008,'2005-09-03',10005),
(20009,'2005-08-10',10003);


insert into orderitems (order_num,order_item,prod_id,quantity) values
(20005,1,'ANV01',10),
(20005,2,'ANV02',3),
(20005,3,'TNT2',5),
(20005,4,'FB',1),
(20006,1,'JP2000',1),
(20007,1,'TNT2',100),
(20008,1,'FC',50),
(20009,1,'FB',1),
(20009,2,'OL1',1),
(20009,3,'SLING',1),
(20009,4,'ANV03',1);
