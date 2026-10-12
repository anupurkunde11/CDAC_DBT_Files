select namefirst,length(namefirst) from student;

select namefirst from student where length(namefirst)=4;

select ascii(substring(namefirst,3)) as ascii from student;

select lower(namefirst),lower(namelast) from student;

select namefirst,namelast,emailid from student where length(emailid)=7;

select namefirst,namelast,substring(namefirst,1,3) from student;