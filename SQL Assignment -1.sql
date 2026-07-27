create database pizza_sales_analysis;
show databases;
use  pizza_sales_analysis;
CREATE TABLE `orders` (
    id INT,
    date DATE
);
ALTER TABLE orders
ADD PRIMARY KEY (id);
USE pizza_sales_analysis;

SHOW TABLES;
DESCRIBE `orders`;

SELECT * FROM `orders`;
RENAME TABLE `order` TO orders;
ALTER TABLE `orders`
ADD PRIMARY KEY (id);

DESC orders;

SELECT * FROM orders;
SHOW TABLES;
DESC orders;

SELECT * FROM orders;
