create database quan_li_ban_hang;
use quan_li_ban_hang;
create table customer(
customerid int primary key,
customername varchar(45),
customerage int
);
create table orders(
orderid int primary key,
customerid int,
foreign key (customerid) references customer(customerid),
orderdate date,
ordertotalprice float
);
create table product(
productid int primary key,
productname varchar(45),
productprice float
);
create table oderdetail(
orderid int,
productid int,
foreign key (orderid)references orders(orderid),
foreign key (productid)references product(productid)
);