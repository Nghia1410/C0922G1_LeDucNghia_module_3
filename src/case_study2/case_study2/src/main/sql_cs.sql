create database furama_web ;
use furama_web;
 
create table `position` (
id int primary key auto_increment,
`name` varchar(45)
);

create table education_degree(
id int primary key auto_increment,
`name` varchar(45)
);

create table division (
id int primary key auto_increment,
`name` varchar(45)
);

create table employee (
id int primary key  auto_increment,
`name` varchar(45),
date_of_birth date,
id_card varchar(45),
salary double ,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int ,
education_degree_id int ,
division_id int ,
username varchar(45),
foreign key(position_id) references `position`(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id)

);


create table customer_type (
id int primary key auto_increment ,
`name` varchar(45)
);

create table customer (
id int primary key auto_increment ,
customer_type_id  int ,
`name` varchar(45),
date_of_birth date,
gender bit (1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
foreign key (customer_type_id) references customer_type(id)
);

 create table attach_facility (
 id int primary key auto_increment,
 `name` varchar(45),
 cost double ,
 unit varchar(10),
 `status` varchar(45)

 );



create table facility_type (
id int primary key auto_increment,
`name` varchar(45)
);

create table rent_type (
id int primary key auto_increment,
`name` varchar(45)
);

create table facility (
id int primary key auto_increment,
`name` varchar(45),
`area` int ,
cost double ,
max_people int ,
rent_type_id int,
facility_type_id int,
standard_room varchar (45),
description_other_convenience varchar(45),
pool_area double ,
number_of_floors int ,
facility_free  text,
foreign key (rent_type_id ) references rent_type(id),
foreign key (facility_type_id ) references facility_type(id)
);



create table contract(
id int primary key auto_increment,
start_date datetime,
end_date datetime ,
deposit double ,
employee_id int ,
customer_id int ,
facility_id int ,
foreign key  (employee_id) references employee(id),
foreign key  (customer_id) references customer(id),
foreign key  (facility_id) references facility(id)
);

create table contract_detail (
id int primary key auto_increment,
contract_id int ,
attach_facility_id int,
quantity int ,
foreign key (contract_id) references contract(id),
foreign key  (attach_facility_id) references  attach_facility(id)
);

create table `user`(
username varchar(225) primary key ,
`password` varchar(255)
);

create table `role` (
role_id int primary key  ,
role_name varchar(255)
);

create table user_role (
role_id int ,
username varchar(255),
foreign key (role_id) references `role`(role_id),
foreign key (username) references `user`(username)
);
INSERT INTO position (id, `name`) VALUES 
('1', 'Qu???n L??') ,
('2', 'Nh??n Vi??n');

INSERT INTO education_degree (id, `name`) VALUES 
('1', 'Trung C???p'),
('2', 'Cao ?????ng'),
('3', '?????i H???c'),
('4', 'Sau ?????i H???c');

INSERT INTO division (id, `name`) VALUES 
('1', 'Sale-Marketing'),
('2', 'H??nh ch??nh'),
('3', 'Ph???c v???'),
('4', 'Qu???n l??');

INSERT INTO customer_type (id, `name`) VALUES
 ('1', 'Diamond'),
 ('2', 'Platinium'),
 ('3', 'Gold'),
 ('4', 'Silver'),
 ('5', 'Member');

INSERT INTO customer (id, `name`, date_of_birth, gender, id_card, phone_number, email, address, customer_type_id) VALUES
	('1', 'Nguy???n Th??? H??o', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng, ???? N???ng', '5'),
	('2', 'Ph???m Xu??n Di???u', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???', '3'),
	('3', 'Tr????ng ????nh Ngh???', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh', '1'),
	('4', 'D????ng V??n Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng', '1'),
	('5', 'Ho??ng Tr???n Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai', '4'),
	('6', 'T??n N??? M???c Ch??u', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Y??n Th???, ???? N???ng', '4'),
	('7', 'Nguy???n M??? Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 L?? L???i, H??? Ch?? Minh', '1'),
	('8', 'Nguy???n Th??? H??o', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguy???n V??n Linh, Kon Tum', '3'),
	('9', 'Tr???n ?????i Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 L?? Th?????ng Ki???t, Qu???ng Ng??i', '1'),
	('10', 'Nguy???n T??m ?????c', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ng?? Quy???n, ???? N???ng', '2');
    
    INSERT INTO employee (id, `name`, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id) VALUES
	('1', 'Nguy???n V??n An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng', '1', '3', '1'),
	('2', 'L?? V??n B??nh', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', '1', '2', '2'),
	('3', 'H??? Th??? Y???n', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai', '1', '3', '2'),
	('4', 'V?? C??ng To???n', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', '1', '4', '4'),
	('5', 'Nguy???n B???nh Ph??t', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', '2', '1', '1'),
	('6', 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', '2', '2', '3'),
	('7', 'Nguy???n H???u H??', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguy???n Ch?? Thanh, Hu???', '2', '3', '2'),
	('8', 'Nguy???n H?? ????ng', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 H??ng V????ng, H?? N???i', '2', '4', '4'),
	('9', 'T??ng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng', '2', '4', '4'),
	('10', 'Nguy???n C??ng ?????o', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', '2', '3', '2');
    
    INSERT INTO rent_type (id, `name`) VALUES
	('1', 'year'),
	('2', 'month'),
	('3', 'day'),
	('4', 'hour');
    
    INSERT INTO facility_type (id, `name`) VALUES
	('1', 'Villa'),
	('2', 'House'),
	('3', 'Room');
    
    INSERT INTO facility (id, `name`, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id) VALUES
	('1', 'Villa Beach Front', '25000', '1000000', '10', 'vip', 'C?? h??? b??i', '500', '4', null, '3', '1'),
	('2', 'House Princess 01', '14000', '5000000', '7', 'vip', 'C?? th??m b???p n?????ng', null, '3', null, '2', '2'),
	('3', 'Room Twin 01', '5000', '1000000', '2', 'normal', 'C?? tivi', null, null, '1 Xe m??y, 1 Xe ?????p', '4', '3'),
	('4', 'Villa No Beach Front', '22000', '9000000', '8', 'normal', 'C?? h??? b??i', '300', '3', null, '3', '1'),
	('5', 'House Princess 02', '10000', '4000000', '5', 'normal', 'C?? th??m b???p n?????ng', null, '2', null, '3', '2'),
	('6', 'Room Twin 02', '3000', '900000', '2', 'normal', 'C?? tivi', null, null, '1 Xe m??y', '4', '3');
    
    INSERT INTO attach_facility (id, `name`, cost, unit, `status`) VALUES
	('1', 'Karaoke', '10000', 'gi???', 'ti???n nghi, hi???n t???i'),
	('2', 'Thu?? xe m??y', '10000', 'chi???c', 'h???ng 1 xe'),
	('3', 'Thu?? xe ?????p', '20000', 'chi???c', 't???t'),
	('4', 'Buffet bu???i s??ng', '15000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
	('5', 'Buffet bu???i tr??a', '90000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
	('6', 'Buffet bu???i t???i', '16000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');
    
    INSERT INTO contract (id, start_date, end_date, deposit, employee_id, customer_id, facility_id) VALUES
	('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
	('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
	('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
	('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
	('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
	('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
	('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
	('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
	('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
	('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
	('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
	('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');
    
    INSERT INTO contract_detail (id, quantity, contract_id, attach_facility_id) VALUES
	('1', '5', '2', '4'),
	('2', '8', '2', '5'),
	('3', '15', '2', '6'),
	('4', '1', '3', '1'),
	('5', '11', '3', '2'),
	('6', '1', '1', '3'),
	('7', '2', '1', '2'),
	('8', '2', '12', '2');


