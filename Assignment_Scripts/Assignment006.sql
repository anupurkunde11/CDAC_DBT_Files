select namefirst,length(namefirst) from student;

select namefirst from student where length(namefirst)=4;

select ascii(substring(namefirst,3)) as ascii from student;

select lower(namefirst),lower(namelast) from student;

select namefirst,namelast,emailid from student where length(emailid)=7;

select namefirst,namelast,substring(namefirst,1,3) from student;

select namefirst,namelast, substring(namefirst,length(namefirst)-2,length(namefirst))as last3 from student;

select number from student_phone where number like'70%';

select * from student limit 5;

select * from student order by id desc limit 5;

select * from student order by namefirst;

select * from student order by namelast desc;

select * from student where length(emailid)>20;

select concat(namefirst,namelast) from student;

select concat(ifnull(namefirst,' '),ifnull(namelast,' ')," and emailID is ",ifnull(emailid,' ')) as output from student;

select upper(namefirst),upper(namelast) from student;

select lower(namefirst),lower(namelast) from student;

select reverse(namefirst),reverse(namelast) from student;

select substring(namefirst,1,4) from student;

select substring(namefirst,2,length(namefirst)-2) from student;

select ascii(namefirst) from student;

select substring(namefirst,1,5) from student;

select number, rpad(number,15,'*') from student_phone;

select * from student where month(dob)=10;

select * from student where month(dob)=1 or month(dob)=12;

select * from faculty where dayname(dob)='sunday';

select now();

select month(curdate());

select year(curdate());

select * from student where year(dob)=1984 order by namefirst;

select * from student where quarter(dob)=4;

select * from student where week(dob)=43;

select * from student where day(dob) between 10 and 19;

select floor(rand()*100);

select substr(namefirst,5,1) from student;

select * from student order by dayname(dob);

select * from student where quarter(dob)=4;

select * from student where dayname(dob)='sunday';

select concat(day(dob),"th of ",monthname(dob)," ",year(dob)) as output from student;

select * from course_batches where dayname(endson)='sunday';

select rpad(substr(number,1,4),10,'*') from student_phone;

select concat( rpad(substr(number,1,4),8,'*'),substr(number,7,10)) from student_phone;











