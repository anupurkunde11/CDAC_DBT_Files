select s1.*,s2.address from student as s1 join student_address as s2 on s1.id=s2.id;

select s1.namefirst,s1.namelast,s1.emailid,s2.* from student as s1 join student_qualifications as s2 on s1.id=s2.studentid;

select s1.namefirst,s1.namelast,s1.emailid,s2.college,s2.university from student as s1 join student_qualifications as s2
    -> on s1.id=s2.studentid
    ->where s2.university='Yale University';

select s1.*,s2.* ,s3.* from student as s1
    -> join student_phone as s2 join student_qualifications as s3
    -> on s1.id=s2.id=s3.studentid;

select s1.id,s1.namefirst,s1.namelast,s2.name,s2.college,s2.university from student as s1 join student_qualifications as s2 on s1.id=s2.studentid where s2.name='BE';

select s1.name,s1.duration from modules as s1 join course_batches as s2 on s1.id=s2.courseid where s2.name='Batch1';

--

select s1.name from modules as s1 join course_modules as s2 on s1.id=s2.moduleid join course as s3 on s2.courseid=s3.id where s3.name='PG-DAC';

--

select s1.namefirst,s1.namelast,s2.number,s1.emailid from student as s1 join student_phone as s2 on s1.id=s2.studentid where s1.id=13;

select s1.namefirst, count(s2.number) from student as s1 left join student_phone as s2 on s1.id=s2.studentid group by s1.id,s1.namefirst;

select s1.namefirst,s1.namelast,s1.dob,s2.address,s3.name,s3.college,s3.university,s3.marks,s3.year from student
    -> as s1 join student_address as s2
    -> on s1.id=s2.studentid
    -> join student_Qualifications as s3
    -> on s1.id=s3.studentid;


select s1.namefirst,s1.namelast,s1.emailid,s2.number,s3.address
    -> from faculty as s1
    -> join faculty_phone as s2
    -> on s1.id=s2.facultyid
    -> join faculty_address as s3
    -> on s1.id=s3.facultyid
    -> where s1.namefirst='ketan';

select s1.name,s2.name from course as s1
    -> left join course_batches
    -> as s2
    -> on s1.id=s2.courseid;

 select s1.* from student as s1
    -> join batch_students as s2
    -> on s1.id=s2.studentid
    -> join course_batches as s3
    -> on s2.batchid=s3.id
    -> join course as s4
    -> on s3.courseid=s4.id
    -> where s4.name='PG-DAC';

select s1.* from course as s1
    -> join course_batches as s2
    -> on s1.id=s2.courseid
    -> where s2.starton='2016-02-01';