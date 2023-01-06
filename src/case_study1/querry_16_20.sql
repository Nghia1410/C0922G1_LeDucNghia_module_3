use furama_resort;

-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set 
  sql_safe_updates = 0;
delete from 
  nhan_vien nv 
where 
  nv.ma_nhan_vien not in (
    select 
      hd.ma_nhan_vien 
    from 
      hop_dong hd 
    where 
      (
        year(hd.ngay_lam_hop_dong) in (2019, 2020, 2021)
      )
  );
  
-- 17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. 
set 
  sql_safe_updates = 0;
update 
  khach_hang 
set 
  ma_loai_khach = 1 
where 
  ma_khach_hang in (
    select 
      ma_khach_hang 
    from 
      (
        select 
          kh.ma_khach_hang 
        from 
          khach_hang kh 
          join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
          join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
          join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
          join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
        where 
          year(ngay_lam_hop_dong) = 2021 
          and ma_loai_khach = 2 
        group by 
          kh.ma_khach_hang 
        having 
          sum(
            dv.chi_phi_thue + dvdk.gia * hdct.so_luong
          ) > 1000000
      ) as sua
  );
select 
  * 
from 
  khach_hang 
  left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach;
  
-- 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET 
  FOREIGN_KEY_CHECKS = 0;
delete from 
  khach_hang 
where 
  khach_hang.ma_khach_hang in(
    select 
      hop_dong.ma_khach_hang 
    from 
      hop_dong 
    where 
      year(hop_dong.ngay_lam_hop_dong)< 2021
  );
  
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
drop view if exists gia_cap_nhat;
create view gia_cap_nhat as 
select 
  dvdk.ma_dich_vu_di_kem, 
  dvdk.ten_dich_vu_di_kem, 
  sum(hdct.so_luong), 
  dvdk.gia 
from 
  dich_vu_di_kem dvdk 
  join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
  join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong 
where 
  year(hd.ngay_lam_hop_dong) = "2020" 
group by 
  dvdk.ma_dich_vu_di_kem 
having 
  sum(hdct.so_luong) > 10;
select 
  * 
from 
  gia_cap_nhat; 
  
-- 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm
--  id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  ma_nhan_vien, 
  ho_ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  nhan_vien 
union all 
select 
  ma_khach_hang, 
  ho_ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  khach_hang 
group by 
  khach_hang.ma_khach_hang
