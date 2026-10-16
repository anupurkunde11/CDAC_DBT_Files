select * from student;

select namefirst,namelast from student;

select * from student where id=10;

select * from faculty;

select * from student where substr(namefirst,2,1)='A';

select * from student where namefirst like '%A%';

select * from student where dob='1986-12-14';

select * from student where namefirst like 'R%';

select namefirst as name, namelast as surname from student ;

select * from student order by dob;

select * from student where namefirst like 'S%' limit 2;

select * from student where dob='1986-12-14';

select * from modules where duration=1;

select * from course_batches where capacity=80;

select * from student_qualifications where name='BE' and marks>70;

select * from student_qualifications where name='BE' and year=2017;

select * from student_qualifications where name='BE' and marks>80 and year=2017;

select * from faculty_qualifications where name='BE' and university='Harvard University';

select * from course where duration=6;

select * from course where duration between 1 and 2 order by duration;

select *,case when year(dob)>1980 then "The student can vote" else "The student cannot vote" end as eligibility from student;

select distinct university from student_qualifications;



