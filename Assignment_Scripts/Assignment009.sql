select s1.*,s2.address from student as s1 join student_address as s2 on s1.id=s2.id;

select s1.namefirst,s1.namelast,s1.emailid,s2.* from student as s1 join student_qualifications as s2 on s1.id=s2.studentid;

select s1.namefirst,s1.namelast,s1.emailid,s2.college,s2.university from student as s1 join student_qualifications as s2
    -> on s1.id=s2.studentid
    ->where s2.university='Yale University';

select s1.*,s2.* ,s3.* from student as s1
    -> join student_phone as s2 join student_qualifications as s3
    -> on s1.id=s2.id=s3.studentid;

select s1.id,s1.namefirst,s1.namelast,s2.name,s2.college,s2.university from student as s1 join student_qualifications as s2 on s1.id=s2.studentid where s2.name='BE';