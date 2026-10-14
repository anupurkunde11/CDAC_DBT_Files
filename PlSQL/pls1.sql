
/*
drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	select 'Hello World';
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare x int default 100 ;
	declare y int ;
	set y=10;
	select x+y as op;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(IN ix int,IN iy int,OUT oz int)
begin
	set oz=ix+iy;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare x int default 3;
	select x*@y;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	select * from emp;
end $
delimiter ;
*/

drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	select empno,ename,phone from emp where month(hiredate) between 6 and 10;
end $
delimiter ;