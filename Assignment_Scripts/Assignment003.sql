select * from course;

select namefirst,namelast from student;

select namefirst,namelast,dob,emailid from student;

select * from student where id=15;

select namefirst,namelast,emailid from student where namefirst='Nitish';

select * from student where id>=12;

select * from student where dob='1980-12-01';

select * from student_phone where studentid=5;

select address from student_address where studentid=10;

select * from faculty;

select number from faculty_phone where facultyid=2;

select number from student_phone where studentid=13;

select * from modules;

select name from course where id=1;

select *from course_batches where capacity=80;

