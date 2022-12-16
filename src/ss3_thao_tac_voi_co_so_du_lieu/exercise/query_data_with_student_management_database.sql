use quan_li_sinh_vien;
select studentname from student where studentname like "H%";
SELECT 
    *
FROM
    class
WHERE
    startdate LIKE '%12%';
    SELECT 
    *
FROM
    subject
WHERE
    credit IN (3 , 4, 5);
    set sql_safe_updates=0;
    update student set classid= 2 where studentname='Hung';
    select* from student;
    
    SELECT 
    s.studentname, sb.subname, m.mark
FROM
    student s
        JOIN
    mark m ON s.studentid = m.studentid
        JOIN
    subject sb ON sb.subid = m.subid
ORDER BY m.mark DESC , s.studentname;