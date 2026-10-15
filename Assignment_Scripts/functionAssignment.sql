drop function if exists sumSalary;
delimiter $
create  function sumSalary(x int) returns int
deterministic
begin 
	declare y int default 0;
	select sum(sal) into y from emp where deptno=x ;
	return y;
end $
delimiter ;


drop function if exists autoNumber;
delimiter $
create function autoNumber() returns int
deterministic
begin 
	declare x int default 0;
	select ifnull(max(studentid),0)+1 into x from student_new;
	return x;
end $
delimiter ;


drop function if exists fn1;
delimiter $
create function fn1(x varchar(50)) returns varchar(40)
deterministic 
begin 
	declare y varchar(50);
	declare z varchar(50);
	declare a varchar(50);
	select username into y from logintable where email=x;
	select password into z from logintable where email=x;
	select email into a from logintable where email=x;
	if(a=x) then return concat("Username = ",y," Password = ",z);
	else return 'Employee not exists';
	end if;
end $
delimiter ;


drop function if exists fn1;
delimiter  $
create function fn1(x int) returns int
deterministic
begin
	declare y int;
	select sum(marks) into y from student_qualifications where studentid=x; 
	return y;
end $
delimiter ;