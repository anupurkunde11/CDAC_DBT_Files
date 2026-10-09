mysql> create table COURSE(
    -> ID int primary key,
    -> name varchar(45),
    -> duration varchar(45),
    -> summery varchar(1024)
    -> );

mysql> create table STUDENT(
    -> ID int primary key,
    -> namefirst varchar(45),
    -> namelast varchar(45),
    -> DOB date,
    -> emailID varchar(128)
    -> );

mysql> create table STUDENT_PHONE(
    -> ID int primary key,
    -> studentID int,
    -> number varchar(45),
    -> isActive bool,
    -> foreign key(studentid) references student(id)
    -> );