create database products;
use products;
create table if not exists product(
id int primary key auto_increment,
product_code varchar(25),
product_name varchar(25),
product_price double,
product_amount int,
product_description varchar(25),
product_status bit
);
-- Chèn một số dữ liệu mẫu cho bảng Products
INSERT INTO `products`.`product` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) VALUES ('1', 'wave', '100', '3', 'moi', '1');
INSERT INTO `products`.`product` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) VALUES ('2', 'dream', '200', '4', 'cu', '0');
INSERT INTO `products`.`product` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) VALUES ('1', 'vario', '50', '2', 'ok','1');
select * from product where product_code = "2";

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index unique_index
on product(product_code);
-- drop index product_code_index on product;
drop index unique_index
on product;
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index composite_index
on product(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from product;

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as
select  product_code, product_name, product_price, product_status
from product;
-- gọi view 
select * from product_view;

-- Tiến hành sửa đổi view -> sửa luôn bản chính
set sql_safe_updates = 0;
update product_view set product_name = "sua bo" where product_code = "a1";

-- Tiến hành xoá view
drop view product_view;
truncate product;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure thong_tin_tat_ca_san_pham ()
begin 
select * from product;
end
// delimiter ;
-- gọi produce
call thong_tin_tat_ca_san_pham();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product (`product_code` varchar(25), `product_name` varchar(25), `product_price`double, `product_amount` int, `product_description` varchar(25), `product_status` bit)
begin 
insert into `products`.`product` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) 
values (`product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`);
end;
// delimiter ;
-- drop procedure add_product;
-- gọi produce
call add_product("5", "ab", 75, 3, "da nang", 0);
call thong_tin_tat_ca_san_pham();

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_theo_id (id_edit int, `product_code_edit` varchar(25), `product_name_edit` varchar(25), `product_price_edit`double, `product_amount_edit` int, `product_description_edit` varchar(25), `product_status_edit` bit)
begin
update product set 
    product_code = product_code_edit,
    product_name = product_name_edit,
    product_price= product_price_edit,
    product_amount = product_amount_edit,
    product_description = product_description_edit,
    product_status =product_status_edit
    where id = id_edit;
end;
// delimiter ;

call update_theo_id (6, "6", "xe dap", 300, 1, "exciter", 1);
call thong_tin_tat_ca_san_pham();

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product (id_delete int)
begin
delete from product where product.id = id_delete;
end;
// delimiter ;

call delete_product(3);
call thong_tin_tat_ca_san_pham();