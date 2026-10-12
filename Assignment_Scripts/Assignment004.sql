select * from student;

select namefirst,namelast from student order by namefirst;

select namefirst,namelast,dob,emailid from student limit 5;

select * from student where id=1 or id=2 or id=5 or id=7;

select namefirst,namelast,emailid from student where id!=5 or id!=10 or id!=15 limit 7;

select * from faculty limit 2;

select number from student_phone order by number;

select address from student_address where studentid=2 or studentid=4 or studentid=6 or studentid=10 order by studentid desc;

 select * from course order by name;

select * from student_qualifications where college='New York';

select * from student_qualifications where name='BE' and college='Florida';

select * from student_qualifications where year=2012 having marks>67;

select * from faculty_qualifications where facultyid=1 or facultyid=3;

select name,college,university from student_qualifications where year=2018;