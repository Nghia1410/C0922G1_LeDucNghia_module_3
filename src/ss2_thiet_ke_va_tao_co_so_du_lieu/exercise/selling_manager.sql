drop database if exists quan_li_ban_hang;
create database if not exists quan_li_ban_hang;
use quan_li_ban_hang;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    customer_age INT
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_total_price DOUBLE,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    product_price DOUBLE
);

CREATE TABLE order_detail (
    order_id INT,
    product_id INT,
    order_detail_qty INT,
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);
