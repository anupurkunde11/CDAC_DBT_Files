create table employee(
	eid int primary key,
	ename varchar(50),
	email varchar(50),
	age int);
insert into employee values(1,'Rahul','rahul@gmail.com',22);
insert into employee (eid,ename,email,age) values(2,'Sagar','sagar@gmail.com',24),(3,'kapil','kapil@gmail.com',28);
desc employee;
select * from employee;