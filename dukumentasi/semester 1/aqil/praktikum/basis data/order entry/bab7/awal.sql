select vendors.vend_name, products.prod_name, min(prod_price) from vendors, products where vendors.vend_id = products.vend_id;


select vendors.vend_city

SELECT vendors.vend_name AS nama_vedors,
MIN(products.prod_price)
FROM vendors
JOIN products ON vendors.vend_id = products.vend_id;

SELECT vendors.vend_name,
products.prod_name,
products.prod_price
FROM vendors
JOIN products ON vendors.vend_id = products.vend_id
WHERE products.prod_name LIKE '%Jetpack%'
AND products.prod_price < 55;

SELECT customers.cust_name,
orders.order_date
FROM customers
JOIN orders ON customers.cust_id = orders.cust_id
WHERE orders.order_date = '2005-09-01';

SELECT customers.cust_name,
customers.cust_contact,
customers.cust_email,
MAX(orderitems.quantity)
FROM customers
JOIN orders ON customers.cust_id = orders.cust_id
JOIN orderitems ON orders.order_num = orderitems.order_num;


SELECT cust_city, cust_country, cust_zip
FROM costomers
WHERE cust_id = '10002';