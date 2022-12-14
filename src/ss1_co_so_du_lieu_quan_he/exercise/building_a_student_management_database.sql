create database my_database1;
use my_database1;

create table class(
  id int primary key, 
  `name` varchar(25)
);

create table teacher(
  id int primary key, 
  name varchar(30), 
  age int, 
  `country` varchar(50)
);
-- thêm phần tử
insert into class(id, `name`)
values(2,'c0922g1'),
(1,'c0822g1'),
(3,'c0722g1');
-- hiển thị
select *from class;

select*from teacher;
-- chỉnh sửa
set SQL_SAFE_UPDATES=0; 
update class set name='c0622g1'where name='c0922g1';
update class set name='c1022g1'where id=2;
-- xóa
delete from class where id=3;