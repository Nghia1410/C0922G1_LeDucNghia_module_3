use quan_li_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
-- cách 1
SELECT 
    *
FROM
    subject
ORDER BY Credit DESC
LIMIT 1;

-- cách 2
SELECT 
    *
FROM
    subject
WHERE
    credit IN (SELECT 
            MAX(credit)
        FROM
            subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    s.*
FROM
    subject s
        JOIN
    mark m ON s.SubId = m.SubId
WHERE
    m.Mark IN (SELECT 
            MAX(Mark)
        FROM
            mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 
    s.*, AVG(m.mark)
FROM
    student s
        JOIN
    mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY AVG(Mark) DESC;

