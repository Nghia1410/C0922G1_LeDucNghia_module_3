create database bai_tap_bai2;
use bai_tap_bai2;
create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);
create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(50)
);
create table chi_tiet_phieu_xuat(
don_gia_xuat float,
so_luong_xuat int,
so_phieu_xuat int,
ma_vat_tu int,
foreign key (so_phieu_xuat)references phieu_xuat(so_phieu_xuat),
foreign key (ma_vat_tu)references vat_tu(ma_vat_tu)
);
create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);
create table chi_tiet_phieu_nhap(
don_gia_nhap float,
so_luong_nhap int,
ma_vat_tu int,
so_phieu_nhap int,
foreign key(ma_vat_tu)references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap)references phieu_nhap(so_phieu_nhap)
);
create table don_dat_hang(
so_dat_hang int primary key,
ngay_dat_hang date
);
create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(50),
dia_chi varchar(50)
);
create table so_dien_thoai(
id int primary key auto_increment,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu int,
so_dat_hang int,
foreign key (ma_vat_tu)references vat_tu(ma_vat_tu),
foreign key (so_dat_hang)references don_dat_hang(so_dat_hang)
);