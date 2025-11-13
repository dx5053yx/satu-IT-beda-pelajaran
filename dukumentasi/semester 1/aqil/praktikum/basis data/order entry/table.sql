create table vendors(
    vend_id char (4) NOT NULL PRIMARY KEY,
    vend_name varchar (25) NOT NULL,
    vend_address varchar (30),
    vend_city varchar (20),
    vend_state varchar (5),
    vend_zip varchar (7),
    vend_country varchar (15)
);

create table customers(
    cust_id char (5) NOT NULL PRIMARY KEY,
    cust_name varchar (25) NOT NULL,
    cust_address varchar (30) NULL,
    cust_city varchar (25) NULL,
    cust_state varchar (5) NULL,
    cust_zip varchar (5) NULL,
    cust_country varchar (20) NULL,
    cust_contact varchar (25) NULL,
    cust_email varchar (30) NULL
);

create table products(
    prod_id varchar (10) NOT NULL PRIMARY KEY,
    vend_id char (4) NOT NULL,
    prod_name varchar (25) NOT NULL,
    prod_price int NOT NULL,
    prod_desc varchar (255) NULL,
    FOREIGN KEY (vend_id) REFERENCES vendors(vend_id)
);

create table orders(
    order_num int NOT NULL PRIMARY KEY,
    cust_id char (5) NOT NULL,
    order_date date NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

create table productnotes(
    note_id char(3) NOT NULL PRIMARY KEY,
    prod_id varchar (10) NOT NULL,
    note_date date NOT NULL,
    note_text varchar (200) NULL,
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
);

create table orderitems(
    order_num int NOT NULL,
    order_item int NOT NULL,
    prod_id varchar (10) NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY (order_num, order_item),
    FOREIGN KEY (order_num) REFERENCES orders(order_num),
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
);