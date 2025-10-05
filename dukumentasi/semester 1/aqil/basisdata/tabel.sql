create table drivers(
    drv_id char (5) NOT NULL primary key,
    drv_name varchar (25) NOT NULL,
    drv_address varchar (30) NOT NULL,
    drv_lisn char (15) NOT NULL,
    drv_contact varchar (15) NOT NULL UNIQUE,
    drv_email varchar (30) NOT NULL

);

CREATE TABLE cust (
     cust_id CHAR(5) NOT NULL PRIMARY KEY,
     cust_name VARCHAR(255) NOT NULL,
     cust_address VARCHAR(255),
     cust_city VARCHAR(50),
     cust_contact VARCHAR(15) NOT NULL UNIQUE,
     cust_email VARCHAR(50) NOT NULL
);

create table routes(
    rout_id char (5) NOT NULL primary key,
    rout_from VARCHAR(255) NOT NULL,
    rout_to VARCHAR(255) NOT NULL,
    rout_distance int NOT NULL
);

CREATE TABLE vehicle (
     veh_plate CHAR(10) NOT NULL PRIMARY KEY,
     veh_model VARCHAR(50) NOT NULL,
     veh_year INT NOT NULL,
     veh_color VARCHAR(30) NOT NULL,
     drv_id char (5) NOT NULL,
     FOREIGN KEY (drv_id) REFERENCES drivers (drv_id)
);

CREATE TABLE promotion (
    promo_id char(5) NOT NULL PRIMARY KEY,
    promo_disc DECIMAL(5, 2),
    promo_name VARCHAR(40),
    promo_desc TEXT,
    promo_start DATETIME,
    promo_end DATETIME
);

CREATE TABLE fare (
    far_id CHAR(5) NOT NULL PRIMARY KEY,
    far_amount INT NOT NULL,
    rout_id char (5) NOT NULL,
    veh_plate CHAR(10) NOT NULL,
    foreign key (rout_id) references routes(rout_id),
    foreign key (veh_plate) references vehicle(veh_plate)
);

CREATE TABLE orders (
    order_id CHAR(5) NOT NULL PRIMARY KEY,
    order_time DATETIME NOT NULL,
    pickup_address VARCHAR(255) NOT NULL,
    destination_address VARCHAR(255) NOT NULL,
    order_status ENUM('Menunggu','Dalam_Perjalanan','Selesai','Dibatalkan'),
    cust_id CHAR(5) NOT NULL,
    drv_id char (5) NOT NULL,
    far_id CHAR(5) NOT NULL,
    promo_id char(5) NOT NULL,
    foreign key (cust_id) references cust(cust_id),
    foreign key (drv_id) references drivers(drv_id),
    foreign key (far_id) references fare(far_id),
    foreign key (promo_id) references promotion(promo_id)
);

create table payment(
    pay_id char (5) NOT NULL primary key,
    pay_type varchar (25) NOT NULL,
    pay_rate INT NOT NULL,
    order_id CHAR(5) NOT NULL,
    foreign key (order_id) references orders(order_id)
);

CREATE TABLE review (
    rev_id CHAR(5) NOT NULL PRIMARY KEY,
    comment VARCHAR(300),
    rate INT CHECK(rate BETWEEN 1 AND 5),
    order_id CHAR(5) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
