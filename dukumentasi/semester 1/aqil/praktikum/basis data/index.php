CREATE TABLE vendors (
    vend_id char(4) NOT NULL PRIMARY KEY,
    vend_name varchar(40) NOT NULL,
    vend_address varchar(30),
    vend_city varchar(20),
    vend_state varchar(5),
    vend_zip varchar(7),
    vend_country varchar(15)
);

create table customers (
    cust_id char(5) not null PRIMARY KEY,
    cust_name varchar(25) NOT NULL,
    cust_address varchar(30) NULL,
    cust_city varchar(25) NULL,
    cust_state varchar(5) NULL,
    cust_zip varchar(5) NULL,
    cust_country varchar(20) NULL,
    cust_contact varchar(25) NULL,
    cust_email varchar(30) NULL

);

create table products (
    prod_id varchar(10) NOT NULL PRIMARY KEY,
    vend_id char(4) NOT NULL,
    prod_name varchar(25) NOT NULL,
    prod_price int NOT NULL,
    prod_desc varchar(255) NULL
);

create table order (
    order_num int not null,
    order_date date not null,
    cust_id char(5) not null,
    primary key(order_num)
);

create table productsnots(
    note_id char(3) not null,
    prod_id varchar(10) not null,
    note_date date not null,
    note_text varchar(200) null,
    primary key(note_id),
    foreign key(prod_id) references products(prod_id)
);

create table orderitems(
    order_num int Not NULL,
    order_item int NOT NULL,
    prod_id varchar(10) NOT NULL,
    quantity int NOT NULL,
    primary key (order_num, order_item)
);