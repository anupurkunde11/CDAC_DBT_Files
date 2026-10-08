create table student(id int auto_increment primary key,name char(40),course char(20),branch char(10),age int);
insert into student (name,course,branch,age) values('Rahul','Btech','CSE',22),
	('Sagar','BE','IT',25),
	('Abujar','Btech','CSE',22),
	('Rajesh','Btech','Civil','21');
desc student;
select * from student;