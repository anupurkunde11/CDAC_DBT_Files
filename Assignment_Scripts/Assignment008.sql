select count(*) from student;

select count(*) from student where year(dob)=1986;

select count(*) from student where namefirst like 'B%';

select count(*) from student where monthname(dob)='July';

select studentid,count(number) from student_phone  group by studentid having count(number)>1;

--

select count(distinct(university)) from student_qualifications;

select university,count(studentid) from student_qualifications where name='BE' group by university;

select count(name) from student_qualifications where name='BE';

select count(name) from student_qualifications where name!='BE';

select max(marks) from student_qualifications where name='BE';

select min(marks) from student_qualifications where name='BE';

select count(name) from course_batches where starton='2016-02-01';

select count(studentid) from student_qualifications where marks>60 and name='BE';

select count(studentid) from student_qualifications where marks>60 and name='BE' and university='Harvard University';

select count(id) from course;

select count(distinct(university)) from student_qualifications;

select max(marks) from student_qualifications where name='BE';