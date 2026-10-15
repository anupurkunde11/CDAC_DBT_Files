/* 

1. codeshare.io/saleel

2. nologin.in/1


drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	select "Hello World" as MesageBox;
end$
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare x int;
	declare y int default  200;
	set x := 100;
	select x + y AS Output;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(in x int, y int)
BEGIN
	select x + y AS Output;
end$
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(in x int, y int, out z int)
BEGIN
	set z := x + y;
end$
delimiter ;






drop procedure if exists pro1;
delimiter $
create procedure pro1(in x int)
BEGIN
	update x set c2 = -1 where c1 = x;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	if  10 = 101 THEN
		select 'Good';
	ELSE
		select 'Bad';
	end if;
	
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare x int default 0;
	lbl1:loop
	   set x := x + 1;
	   select x;
	   if x > 9 THEN
		 leave lbl1;
	   end if;
	end loop;
end$
delimiter ;






drop procedure if exists pro1;
delimiter $
create procedure pro1(in ename varchar(30))
BEGIN
 declare ename varchar(30);
 select ename;
 select emp.ename from emp where emp.ename=ename;
	
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(in p_deptno int, in p_dname varchar(20))
BEGIN
 insert into dept(deptno, dname) values(p_deptno, p_dname);
 select "Data Inserted..." as MessageBox;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(in p_deptno int)
BEGIN
declare x int;
select deptno into x from dept where deptno = p_deptno;
   
  if x is not null then
	select dname from dept where deptno = p_deptno;
  ELSE
		select "Not found";
  end if;
   
end$
delimiter ;





drop procedure if exists pro1;
delimiter $
create procedure pro1(in p_deptno int)
BEGIN
  
  if (select true from dept where deptno=p_deptno) then
	select dname from dept where deptno = p_deptno;
  ELSE
		select "Not found";
  end if; 
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1(in p_deptno int)
BEGIN
  
  if (select distinct true from emp where deptno=p_deptno) then
	select ename, deptno from emp where deptno = p_deptno;
  ELSE
		select "Not found";
  end if; 
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1(in p_deptno int)
BEGIN
  
  if (select distinct true from dept where deptno=p_deptno) then
	select ename, deptno from emp where deptno = p_deptno;
  ELSE
		select "Not found";
  end if; 
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1(in x int,  in y int)
BEGIN
	declare cnt int default 0;
 select count(*) - x into cnt from emp;
 
 select row_number() over() R1, ename from emp limit cnt, y;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
  declare cnt int default 0;
  declare x varchar(30) default '';
  declare a int;
  select count(*) + 1 into a from p;
  lbl:loop
   set cnt := cnt + 1;
	set x := concat(x, cast(char(floor(97 + rand() * 26)) as char));
	if cnt > 9  then
		leave lbl;
	end if;
  end loop;
  select x as "Product key";
  insert into p(c1, c2) values(a, x);
end$
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(in x int)
BEGIN
	select * from (select ename, sal, dense_rank() over(order by sal desc) R1 from emp) t1 where R1 = x;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	create table if not exists k (c1 int, c2 int);
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare exit handler for sqlexception
	
	BEGIN
		rollback;
		select "Transaction Rolledback"	;
	end;
    
	start transaction;
      update b set a2 = 400 where a1=1;
	  insert into a values(4,4);
	commit;
	select "Transaction Completed..";
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
    declare x int default 0;
	start transaction;
	 insert into a values(5,5);
     update b set a2 = 500 where a1=7;
	 
	 set x := row_count(); 
	  if x = 0 then
		rollback;
		select "Rollback Done";
	  ELSE
		commit;
		select "Commit Done";
	  end if;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(in _columnName varchar(1000), in _tableName varchar(64))
BEGIN
	declare exit handler for 1054 select "some error message";
   set @x := concat("select ", _columnName, " from " , _tableName);
    prepare a from @x;
	execute a;
   
end$
delimiter ;





drop procedure if exists pro1;
delimiter $
create procedure pro1(x int, y int)
BEGIN
   select x+y;   
end$
delimiter ;

drop procedure if exists pro2;
delimiter $
create procedure pro2(x int, y int)
BEGIN
   select x*y;   
end$
delimiter ;

drop procedure if exists pro3;
delimiter $
create procedure pro3(in x int)
BEGIN
   select empno, ename, job, sal, deptno from emp where deptno = x; 
end$
delimiter ;


drop procedure if exists main;
delimiter $
create procedure main(in pNo int, v1 int, v2 int)
BEGIN
	declare x varchar(64) default '';
    select f2 into x from a where f1= pNo;  
	
	if pNo <> 3 then
		set @z := concat("CALL ", x , "(", v1, ",", v2, ")");
	ELSE
	   set @z := concat("CALL ", x , "(", v1, ")");
	end if;

	prepare stmt from @z;
    execute stmt;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare x , y int default 0;
	declare a varchar(2000) default '';
	select min(id), max(id) into x , y from missingnumbers;
	lbl:loop
		set a := concat(a, ",", x);
		set x:=x + 1;	
		if x > y then
			leave lbl;
		end if;
	end loop lbl;
	select a;
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare x int default 1001;
	BEGIN
	declare y int default 2001;
	set x:= x + 9;
		select x;
		select y;
	end;
	select x;
	select y;
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare x  int default 0;
	declare y, z varchar(30);
	declare c1 cursor for select deptno, dname, loc from dept;
	
	OPEN c1;
	lbl1:loop
		fetch c1 into x, y, z;
	    select x, y, z;
		select ename, job, deptno from emp where deptno = x;
	end loop lbl1;

	close c1;
end$
delimiter ;




drop function if exists fn1;
delimiter $
create function fn1() returns varchar(100)
deterministic
BEGIN
	declare x varchar(100);
	set x :=  "Hello World";
	return x;
end$
delimiter ;





drop function if exists fn1;
delimiter $
create function fn1( x int, y int) returns int
deterministic
BEGIN
	return (ifnull(x,0) + ifnull(y,0));
end$
delimiter ;




drop function if exists fn1;
delimiter $
create function fn1() returns int
deterministic
BEGIN
	declare x int;
		select max(deptno) + 10 into x from dept;
		return x;
end$
delimiter ;



drop FUNCTION if exists fn1;
delimiter $
create FUNCTION fn1() returns varchar(100)
deterministic
BEGIN
  declare cnt int default 0;
  declare x varchar(30) default '';
  lbl:loop
   set cnt := cnt + 1;
	set x := concat(x, cast(char(floor(97 + rand() * 26)) as char));
	if cnt > 9  then
		leave lbl;
	end if;
  end loop lbl;
  return x;

end$
delimiter ;



1. Create a UDF that extracts the domain name (part after @) from an email.

2. Write a UDF that returns tax as per:
	0% if salary < 2500
	5% if salary between 2500–5000
	10% if salary > 5000.

3. Create a UDF that returns the initials of a full name ("Saleel Bagde" → "S.B").

4. Write a UDF that returns the number of vowels in the string ("Saleel Bagde" → 5).

5. Write a UDF that converts the first letter of every word into uppercase and the  
   rest lowercase ("saleel bagde" → "Saleel Bagde"). 






drop FUNCTION if exists fn1;
delimiter $
create FUNCTION fn1(x int) returns varchar(50)
deterministic
BEGIN
 declare a varchar(30);
 select substr(emailID, instr(emailID, '@')+1) into a from student where studentID = x;
 
 if a is not null then
	return a;
 else
	return "emailID not found for the give studentID";
 end if;
 
end$
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare a int;
	declare b varchar(40);
	
	declare c1 cursor for select studentID, emailID from student;
	
	declare exit handler for 1329  select "No data";
	open c1;
	 lbl:loop
	   fetch c1 into a, b;
		select ifnull(substr(b, instr(b, '@')+1), 'StudentID is not having emailID') from student where studentID = a;
	 end loop lbl;
	close c1;
end$
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on dept for each row
BEGIN
	select "Hello world";
end$
delimiter ;



mysql> 



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on dept for each row
BEGIN
	insert into d values(new.deptno, new.dname, new.loc, new.pwd, new.startedon, curdate(), curtime(), user());
	
end$
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 before delete on dept for each row
BEGIN
	insert into d values(old.deptno, old.dname, old.loc, old.pwd, old.startedon, curdate(), curtime(), user());
end$
delimiter ;

insert into dept(dname) value('hhh');


drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on dept for each row
BEGIN
	declare x int default 0;
	select max(deptno) + 1 into x from dept;
	
	set new.deptno := x;
	
end$
delimiter ;

mysql> insert into dept values(76,1,1,1,1);
mysql> insert into dept values(75,1,1,1,1);

drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on dept for each row
BEGIN
	if new.deptno = 75 then
		signal SQLstate '45000'  set message_text = 'Invalid deptno';
	end if;
end$
delimiter ;


set new.column_name = new_value ----->  trigger time BEFORE



create table before_after_1(c1 int primary key auto_increment, c2 int);
create table before_after_2(c1 int, c2 int);
-----------------------------------------------------------------------
create table a(c1 int primary key auto_increment, c2 int); ---> only 4 rows
------------------------------------------------------------------------
create table employee_job(id int, job varchar(20));
insert into employee_job values(1, 'a');

create table employee_job_history(id int, oldJob varchar(20), newJob varchar(20));
-----------------------------------------------------------------------
drop table sales;
drop table stock;
create table sales(salesID int, productID int, salestype enum('s', 'c') , quantity int);

create table stock(productID int primary key, productName varchar(20), productStock int);

insert into stock values(1, 'Bread', 1000),(2, 'Butter', 1000),(3, 'Cheese', 1000);



create table before_after_1(c1 int primary key auto_increment, c2 int);
create table before_after_2(c1 int, c2 int);
MySQL> insert into  before_after_1(c2) values (1000);

drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on before_after_1 for each row
BEGIN
	insert into before_after_2 values(new.c1, new.c2);
end$
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on a for each row
BEGIN
	declare x int default 0;
	select count(*) into x from a;
	
	if x >  4 then
		signal sqlstate '45000' set message_text = 'Done';
	end if;
end$
delimiter ;


create table employee_job(id int, job varchar(20));
insert into employee_job values(1, 'a');  ---> b

create table employee_job_history(id int, oldJob varchar(20), newJob varchar(20));


drop trigger if exists tr1;
delimiter $
create trigger tr1 after update on employee_job for each row
BEGIN
	
	insert into employee_job_history values(1, old.job, new.job );
	
end$
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on sales for each row
BEGIN
	if new.salestype = 's' then
		update stock set productStock = productStock - new.quantity where  productID = new.productID;	
	elseif new.salestype = 'c' then
		update stock set productStock = productStock + new.quantity where  productID = new.productID;
	end if;	
end$
delimiter ;



DROP TRIGGER IF EXISTS tr1;
delimiter $$
CREATE TRIGGER tr1 BEFORE INSERT ON temp FOR EACH ROW
begin
   INSERT INTO temp1 VALUES(LAST_INSERT_ID());
end $$
delimiter ;





drop procedure if exists pro1;
delimiter $ 
create procedure pro1(out x varchar(20))
BEGIN
	set x :=  "Hello World";
end$
delimiter ;


drop procedure if exists pro1;
delimiter $ 
create procedure pro1(out x varchar(20))
BEGIN
	select @a,@b, @c;
	set x := 'Welcome';
end$
delimiter ;



drop procedure if exists pro1;
delimiter $ 
create procedure pro1(in x int)
BEGIN
	
	if (select true from customer where CUSTID = x) then
		begin
		    declare oid, cid int;
			declare odate, sdate date;
			
			declare c1 cursor for select ORDID, ORDERDATE, CUSTID, SHIPDATE from ord where  ord.CUSTID = x;
			declare exit handler for 1329 select 'EOF';
			
			open c1;
			 lbl:loop
			   fetch c1 into oid, odate, cid, sdate;
			   select oid, odate, cid, sdate;
			 end loop lbl;
			close c1;
		end;
	else
		select 'Not Found';
	end if;
end$
delimiter ;






drop procedure if exists pro1;
delimiter $ 
create procedure pro1(out x varchar(20))
BEGIN
	select @a,@b, @c;
	set x := 'Welcome';
end$
delimiter ;




drop procedure if exists pro1;
delimiter $ 
create procedure pro1(in x varchar(10))
BEGIN
	declare l, cnt, z int default 0;
	set l := length(x);
	set cnt := 1;
	lbl:loop
		if  substr(x, cnt, 1) in ('a','e','i','o','u') then
			set z := z + 1;
		end if;
		set cnt:=cnt + 1;
		if cnt > l then
			leave lbl;
		end if;
	end loop lbl;
	select z;
end$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1() 
begin
declare _id, cnt int;
declare j json;

declare c1 cursor for select * from product;

declare exit handler for 1329 select "done";
open c1;
	lbl:loop
		set cnt := 0;
		fetch c1 into _id, j;
		select _id, j->'$.product_id' 'Product ID';
		
		lbl2:loop
			select JSON_EXTRACT(j, concat('$.size[', cnt, ']') );
			set cnt := cnt + 1;
			
			if cnt > JSON_LENGTH(j->'$.size') -1 then
				leave lbl2;
			end if;
		end loop lbl2;
	end loop lbl;
close c1;
end$
delimiter ;


Drop procedure IF EXISTS pro1;
  delimiter $
  create procedure pro1(IN iX INT)
    begin
	 set iX := iX + 1001;
     select iX;
    end$
delimiter ;




WITH RECURSIVE cte(a) AS (SELECT 1 UNION ALL SELECT a + 1 FROM cte    WHERE a < 10) SELECT a, CASE WHEN a <= 5 THEN 'xxxx' ELSE 'yyyy' END  AS result FROM cte;



WITH RECURSIVE cte AS (SELECT empno, ename, mgr, cast(ename as char(200)) path FROM emp WHERE mgr IS NULL UNION ALL SELECT e.empno, e.ename, e.mgr, CONCAT(p.path, '->', e.ename) FROM emp e JOIN cte p ON e.mgr = p.empno) SELECT ename, path FROM cte;




WITH RECURSIVE cte AS (SELECT empno,         ename, mgr, 1 AS level FROM emp WHERE mgr IS NULL UNION ALL SELECT e.empno, e.ename, e.mgr, c.level + 1 FROM emp e JOIN cte c ON e.mgr = c.empno)select * from cte;

*/


/* 

drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	select 'Hello World...' R1;
end $
delimiter ;





drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare x int default 100;
	declare y int default 200;
	select x + y;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN x int, IN y int)
begin
	select x + y;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN iDeptno int)
begin
	select empno, ename, sal, deptno from db1.emp where deptno = x and sal >= y;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN x int, OUT y int)
begin
	
	
end $
delimiter ;

 

drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
   set @a = 'Vasant'; 
   select @z;
end $
delimiter ;


 

drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN x int)
begin
   if  x = 10 then
		select 'Goode';
   else
		select 'Bad';
   end if;
	
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN x int)
begin
  declare flag bool default FALSE;

  select True into flag from emp where empno = x;
  
  if flag then
	select empno, ename, sal from emp where empno = x;
  else
	select 'Not Found' as 'Message Box';
  end if;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN x int, IN y varchar(20))
begin

	insert into dept(deptno, dname) values (x, y);
	select 'Record Inserted.....' R1;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare x int default 0;
		lbl1:loop
			set x = x + 1;
			select x;
			if x = 10 then
				leave lbl1;
			end if;
		end loop lbl1;
end $
delimiter ;





drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare a int default 0;
	select count(*) - 1 into a from emp;
	 select ename from emp limit a,1 ;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	create table f1(c1 int);
end $
delimiter ;


18002662696





drop procedure if exists pro1;
delimiter $
create  procedure pro1(x int)
begin
	if x <= 10 then
		select  "<=10";
		elseif x > 11 then
			select ">11";
	else
		select "Good";
	end if;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1(y varchar(10), z varchar(10))
begin
	--insert into a values(default, y, z); 
	insert into a(c2, c3) values( y, z);
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1(y varchar(10), z varchar(10))
begin
	if z = 'pune' then
		insert into a(c2, c3) values( y, z);
		select "Record inserted ....";
	else
		select 'Invalid city';
	end if;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN ioid int, iproductNmae1 varchar(20), IN irate1 int, IN iqty1 int , iproductNmae2 varchar(20), IN irate2 int, IN iqty2 int)
begin
	declare exit handler for sqlexception
	begin 
		rollback;
		select "Rollbacked....";
	end ;
	start transaction read write;
	   insert into orders values(ioid, now());
	   insert into orderdetails(oID,  productNAme, rate, qty) values(ioid, iproductNmae1, irate1, iqty1), (ioid, iproductNmae2, irate2, iqty2);
	commit;
	select 'Record inserted  ..';   
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare exit handler for 1062 select "duplicate ID" R1;
	
	declare exit handler for 1366 select 'datatype mismatch' R2;
	
	insert into orders values('A',now());
end $
delimiter ;

prepare stat from @x;
	execute stat;
	



drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN y varchar(1000), IN iNM varchar(64))
begin
	declare exit handler for 1146 select 'TAble not found';
	set @x := concat("select ", y,  " from ", iNM);
	select @x;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare v1 int;
	declare v2, v3, v4, v5 varchar(20);
	
	declare c1 cursor for select * from dept;
	declare exit handler for 1329 select "No more data to fetch";
	open c1;
	lbl1:loop
		fetch c1 into v1, v2, v3, v4, v5;
		select v1, v2, v3, v4, v5;
	end LOOP lbl1;
	 
	close c1;
end $
delimiter ;





drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare v1, v2 int;
	declare v3, v4 varchar(20);
	
	declare c1 cursor for select empno, ename, job, sal from emp;
	declare exit handler for 1329 select "No more data to fetch";
	open c1;
	lbl1:loop
		fetch c1 into v1, v3, v4, v2;
		select v1, v3, v4, v2;
	end LOOP lbl1;
	 
	close c1;
end $
delimiter ;






drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	
	declare  xempno, xsal, xdeptno int;
	declare xename, xjob  varchar(100); 
	declare c1 cursor for select empno, ename, job, sal, deptno from emp;
	declare exit handler for 1329 select "No more records";
	
	open c1;
		lbl1:loop
			fetch c1 into  xempno, xename, xjob, xsal, xdeptno;
			if xdeptno = 10 then
				insert into db2.e10 values(xempno, xename, xjob, xsal, xdeptno);
			elseif xdeptno = 20 then
				insert into db2.e20 values(xempno, xename, xjob, xsal, xdeptno);
			end if;
		end loop lbl1;
	close c1;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	declare x int;
	declare y datetime;
	declare c1 cursor for select oid, odate  from orders;
	declare exit handler for 1329 select "No more records";
	open c1;
	loop
		fetch c1 into x, y;
		
		if  datediff(y, now()) >=5 then
			update orders set status='Delayed..' where odate>=y;
		end if;
	end loop;
	close c1;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create  procedure pro1()
begin
	set @x := 'Hello WOrld';
	call display();
end $
delimiter ;


drop procedure if exists display;
delimiter $
create  procedure display()
begin
	select "Add";
	call add1(12,12);
end $
delimiter ;


drop procedure if exists add1;
delimiter $
create  procedure add1(x int, y int)
begin
	select x+y;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create  procedure pro1(IN x int, OUT a int, OUT b int)
begin
	
	set a := x*x;
	set b := x*x*x;
end $
delimiter ;

drop procedure if exists display;
delimiter $
create  procedure display()
begin
	declare p1, p2  int;
	call pro1(4, p1, p2);
	select  p1, p2;
end $
delimiter ;


drop function if exists fn1;
delimiter $
create  function fn1() returns varchar(100)
deterministic
begin
	declare x varchar(100);
	select concat('hello ->' , 123) into x;
	return x;
end $
delimiter ;



drop function if exists fn1;
delimiter $
create  function fn1(x int, y int) returns int
deterministic
begin
	return (ifnull(x,0)+ ifnull(y,0));
end $
delimiter ;




drop function if exists fn1;
delimiter $
create  function fn1() returns varchar(100)
deterministic
begin
	declare x int;
	select max(deptno) + 1 into x from dept;
	if x%2 = 0 then
		insert into  s values(x, concat('S/A-',  x));
	else
		insert into  s values(x, concat('C/A-',  x));
	end if;
	return x;
end $	
delimiter ;




drop function if exists fn1;
delimiter $
create  function fn1() returns int
deterministic
begin
	return (select max(deptno) + 1 from dept);
end $	
delimiter ;


with recursive cte as (select 1 n  union select  n + 1 from cte where n<20) select n,  fn1() from cte;

DROP FUNCTION IF EXISTS fn1;
delimiter $
CREATE FUNCTION fn1() RETURNS VARCHAR(40)
deterministic
begin
    declare x, y, z VARCHAR(40) default "";
    declare cnt INT default 1;
    lbl:loop
       SELECT CAST(CHAR(FLOOR(65 + RAND() * 27)) as CHAR) INTO y;
       SELECT CAST(CHAR(FLOOR( 97 + RAND() * 27)) as CHAR) INTO z;
       SET x := CONCAT(x, y, z);
       if cnt >2 then
          leave lbl;
       end if;
       SET cnt := cnt + 1;
    end loop lbl;
    return(x);
end $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert  on  dept for each row
begin
	select "Hello World from trigger" into @x;
end $
delimiter ;






MYSQL> INSERT INTO DEPT(dname) VALUES('xyz');



NEW.DEPTNO = 80
NEW.DNAME = upper(NEW.DNAME)
NEW.loc = BARODA
NEW.PWD = ABCBAC 
NEW.STARTEDON = 18/03/2026


NEW.DEPTNO = 80
NEW.DNAME = ABC
NEW.loc = BARODA
NEW.PWD = ABCBAC 
NEW.STARTEDON = 18/03/2026



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert  on  dept for each row
begin
	set NEW.DNAME = upper(NEW.DNAME);
end $
delimiter ;


drop trigger if exists tr2;
delimiter $
create trigger tr2 before insert  on  dept for each row
begin
	declare x int;
	select max(deptno) + 1 into x from dept;
	
	set NEW.DEPTNO = x;
end $
delimiter ;






===============================================
signal sqlstate "45000' set message_text = 'Invalid';



drop trigger if exists tr1;
delimiter $
create trigger tr1 before delete  on  dept for each row
begin
	insert into bkdept values (OLD.DEPTNO, OLD.DNAME,OLD.loc, OLD.PWD, OLD.STARTEDON, user(), curdate(), curtime());
end $
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert  on  a for each row
begin
	insert into b(c1) values (NEW.c1);
end $
delimiter ;


iMYSQL> nsert into a(c2) values(-2);



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert  on  a for each row
begin
	if  dayname(curdate()) = 'Friday' then
	  signal sqlstate '42000' set message_text = "Invalid day today is friday .......";
	end if;
end $
delimiter ;

-------------------------- TODO -----------------------------


CREATE TABLE Products (product_id INT AUTO_INCREMENT PRIMARY KEY, product_name VARCHAR(100), sku VARCHAR(30) UNIQUE);


drop procedure if exists pro1;
DELIMITER $
CREATE PROCEDURE pro1(IN iProductName VARCHAR(100), IN isku VARCHAR(30))
BEGIN
	DECLARE EXIT HANDLER FOR 1062 
	begin 
		SELECT 'Duplicate SKU Found' AS Message;
	end;
    INSERT INTO Products(product_id, product_name, sku) VALUES(default, iProductName, isku);
    SELECT 'Product Added Successfully' AS Message;
END $
DELIMITER ;







create table users (user_id int, user_name varchar(10));

create table user_attempte (user_id int primary key , attempte int default 1);





drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on product_visit_log for each row
begin
	insert into product_views(product_id) values (new.product_id) ON DUPLICATE KEY UPDATE total_views = total_views + 1;
end $
delimiter ;


DROP TRIGGER IF EXISTS tr1;
delimiter $
CREATE TRIGGER tr1
AFTER INSERT ON page_logs FOR EACH ROW
BEGIN
    INSERT INTO page_counter(page_url) VALUES(NEW.page_url) ON DUPLICATE KEY UPDATE visits = visits + 1;
END $
DELIMITER ;


DROP PROCEDURE IF EXISTS pro1;
DELIMITER $$
CREATE PROCEDURE pro1()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE tname VARCHAR(100);

    DECLARE c1 CURSOR FOR SELECT table_name FROM information_schema.tables WHERE table_schema = DATABASE();

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN c1;
    lbl: LOOP
        FETCH c1 INTO tname;
        IF done = 1 THEN
            LEAVE lbl;
        END IF;
         SET @q = CONCAT('SELECT ''', tname, ''' AS table_name, COUNT(*) AS total_rows ', 'FROM ', tname, ' HAVING COUNT(*) > 7' );
	 	    PREPARE stmt FROM @q;
			EXECUTE stmt;
    END LOOP;
    CLOSE c1;
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS pro1;
DELIMITER $$
CREATE PROCEDURE pro1()
BEGIN
	DECLARE tname VARCHAR(100);
	DECLARE tnm VARCHAR(1000) default "";
    DECLARE c1 CURSOR FOR SELECT table_name FROM information_schema.tables WHERE table_schema = DATABASE();

	DECLARE CONTINUE handler FOR 1329 select tnm; 
	
    OPEN c1;
    lbl:LOOP
       FETCH c1 INTO tname;
         SET @stat := CONCAT("select count(*) into @y from ", tname);
		 PREPARE x FROM @stat;
		 EXECUTE x;
		 if @y > 30 then
			set tnm := concat(tnm, tname, ", ");
		 end if;
	END LOOP lbl;
    CLOSE c1;
END $$
DELIMITER ;


drop procedure if exists pro1;
delimiter $$
create procedure pro1()
begin
	declare tableName varchar(1000);
	declare cnt int default 0;
	    
	declare c1 cursor for select table_name, count(column_name)from information_schema.columns where table_schema = database() group by table_name having count(*) > 9;
	DECLARE EXIT handler FOR 1329 select "Done...";
	
    open c1;
    lbl:loop
       fetch c1 into tableName, cnt;
	   SELECT tableName, cnt;
	end loop lbl;
    close c1;
	
end $$
delimiter ;
-------------------------------------------------
---
DROP PROCEDURE IF EXISTS pro1;
delimiter $$
CREATE PROCEDURE pro1()
begin
    declare c1 CURSOR FOR SELECT * FROM student;
    OPEN c1;
     SELECT found_rows();
end $$
delimiter ;


drop procedure if exists pro1;
delimiter $$
create procedure pro1(IN iStart INT, IN iEnd INT)
begin
	declare tableName varchar(1000);
	
	declare cnt INT default 0;
	declare tableList TEXT default "";
	
	declare c1 cursor for select table_name, count(column_name)from information_schema.columns where table_schema = database() group by table_name having count(*) between iStart and iEnd;
	
	declare EXIT HANDLER FOR 1329 select tableList;
	
    open c1;
    lbl:loop
       fetch c1 into tableName, cnt;
	   
	   set tableList:= concat(tableName, " table has (",  cnt, ") columns \n ", tableList);
	end loop lbl;
    close c1;
end $$
delimiter ;

  DELETE FROM e;



drop procedure if exists pro1;
delimiter $$
create procedure pro1()
begin
	declare xx int;
	DECLARE c1 cursor FOR SELECT empno FROM e1;
	DECLARE EXIT HANDLER FOR 1329 SELECT "done";
	DELETE FROM e1;
   OPEN c1;
   lbl:loop
       FETCH c1 INTO xx;
	   
	   SELECT xx;
	end loop lbl;
    close c1;
end $$
delimiter ;



CREATE EVENT event1 ON SCHEDULE EVERY 10 SECOND 
DO INSERT INTO x(c2) VALUES(floor( 10 + rand() * 60 ));

----------------- Event ----------------


DROP PROCEDURE pro1;

delimiter $

CREATE PROCEDURE pro1()
begin
	SET @x := 'insert into eventcounter(c1) values(default)';
	PREPARE stat from @x;
	EXECUTE STAT;
end $
delimiter ;


DROP EVENT IF EXISTS Event1;
CREATE EVENT event1 ON SCHEDULE EVERY 10 SECOND
DO
	CALL PRO1();


--------------------------------------



DROP EVENT IF EXISTS event1;

CREATE EVENT event1 ON SCHEDULE EVERY 10 SECOND
DO
UPDATE ccatStudents SET status = 'Verified' WHERE status = 'Pending' ORDER BY id LIMIT 1;



DROP EVENT IF EXISTS event2;

CREATE EVENT event2 ON SCHEDULE EVERY 12 SECOND 
DO
UPDATE ccatStudents SET status = 'Hall Ticket Issued' WHERE status = 'Verified' order by id limit 1;



DROP EVENT IF EXISTS event3;
delimiter $
CREATE EVENT event3 ON SCHEDULE EVERY 15 SECOND
DO
BEGIN
  IF (SELECT COUNT(*) FROM ccatStudents WHERE status = 'Pending') = 0 THEN
        ALTER EVENT event1 DISABLE;
		ALTER EVENT event2 DISABLE;
  END IF;
END$
delimiter ;






DROP EVENT IF EXISTS event1;
delimiter $
CREATE EVENT event1 ON SCHEDULE EVERY 10 SECOND
DO
 begin
 
   UPDATE cnt SET c1 = (SELECT MAX(c1) + 1 FROM cnt);
 end $
delimiter ;


1. Auto-cancel unpaid appointments after a grace period



DROP EVENT IF EXISTS event1;
delimiter $
CREATE EVENT event1 ON SCHEDULE EVERY 1 MINUTE
DO
 begin
 
   UPDATE appointment SET status = 'Cancelled' where status = 'Booked' order by appointment_id 
END$
delimiter ;




UPDATE ccatstudents SET processed = 'N';
UPDATE ccatstudents SET status = 'Pending';
DELETE FROM ccatstudents_log;

DROP EVENT IF EXISTS event1;
delimiter $
CREATE EVENT event1 ON SCHEDULE EVERY 10 SECOND
DO
 begin
  INSERT INTO ccatstudents_log(id, formNumber, studentName, status, processed) SELECT id, formNumber, studentName, status, 'N' FROM ccatstudents WHERE processed = 'N' ORDER BY id LIMIT 1;
  
  UPDATE ccatstudents SET processed = 'Y', status = 'Done' WHERE processed = 'N' ORDER BY id LIMIT 1;
  
  UPDATE ccatstudents_log SET status = 'Processed...',  processed = 'Y', hallTicket = UUID() WHERE processed = 'N' ORDER BY id LIMIT 1;
end $
delimiter ;



UPDATE stock set status = NULL;
DROP EVENT IF EXISTS event1;
delimiter $
CREATE EVENT event1 ON SCHEDULE EVERY 10 SECOND
DO
  begin
	UPDATE stock SET status = CASE WHEN quantity_on_hand < (quantity_reserved + reorder_level) THEN 'Low Stock...' ELSE 'Good Stock'END;
  end $
delimiter ;



*/

/* select id, id % 10 R1 , case when id % 10 = 0 then id else id % 10 end R2  from ccatStudents; */



/* 
	1. Expire Subscriptions Automatically (Daily) 

UPDATE subscription SET subscription_status = NULL;

 WHERE  expiration_date < CURRENT_DATE() AND subscription_status = 'Active' ORDER BY subscription_ID LIMIT 1
*/
/*
	2. 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	    BEGIN
        ROLLBACK;
        SELECT "Transaction rolledback...";
    END; 




DROP PROCEDURE IF EXISTS transferMmoney;
DELIMITER //

CREATE PROCEDURE transferMmoney()
BEGIN
    START TRANSACTION;

    UPDATE account
    SET balance = balance - 5000
    WHERE account_id = 101;

    UPDATE account
    SET balance = balance + 10000
    WHERE account_id = 103;
	
		IF ROW_COUNT() = 0 THEN
			ROLLBACK;
			SELECT "Transaction rolledback...";
		else
			COMMIT;
			SELECT "Transaction completed successfully...";
		END IF;
    
END //

DELIMITER ;




DROP TRIGGER IF EXISTS tr1;
delimiter $
CREATE TRIGGER tr1 BEFORE INSERT ON has_data_changed FOR EACH ROW
begin
	set NEW.hash_value = MD5(NEW.ename);
end $
delimiter ;


DROP TRIGGER IF EXISTS t1;
delimiter $$
CREATE TRIGGER t1 BEFORE INSERT ON has_data_changed FOR EACH ROW
begin
     set NEW.hash_value = MD5(NEW.ename);
end $$
delimiter ;



DROP EVENT IF EXISTS event1;

CREATE EVENT event1 ON SCHEDULE EVERY 12 SECOND 
DO
UPDATE ccatStudents SET status = 'Verified' WHERE status = 'Pending' ORDER BY id LIMIT 1;

*/






/*
drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
		select 'Hello World' R1 ;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare x int default 100;
	declare y int;
	declare z int;
		set y:= 200;
		select x + y;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare x int default 100;
	set @y := 200;
	select x + @y + @z AS "G.V used";
end $
delimiter ;





drop procedure if exists pro1;
delimiter $
create procedure pro1(IN iX int, IN iY int, OUT oZ1 int, OUT oZ2 int)
begin
	set  oZ1 := iX * iY;
	set  oZ2 := iX / iY;
end $
delimiter ;


 
drop procedure if exists pro1;
delimiter $
create procedure pro1(IN iJob varchar(20))
begin
	select empno, ename, job, sal, dname from emp, dept  where emp.deptno = dept.deptno and job = iJob;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1(x int)
begin
	select sum(Sal) from emp where deptno = x;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(x int, out z int)
begin
	select sum(Sal) into z from emp where deptno = x;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(x int)
begin
	select sum(Sal) into @z from emp where deptno = x;
end $
delimiter ;





drop procedure if exists pro1;
delimiter $
create procedure pro1(IN x int)
begin
	if x >= 1000 then
		insert into q values(default, x);
	ELSE
		select "invalie data for column c2..." as "Message Windon";
	end if;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1(IN x int)
begin
	
	delete from q where c1 = x;
	
	if row_count() = 0 then
		select "R N D";
	else
		select "R D S";
	end if;
end $
delimiter ;


drop table b, a;

create table a(id int primary key, ename varchar(20));
insert into a values(1, 'saleel'), (2,'sharmin');

create table b(id int, address varchar(20), foreign key(id) references a(id));

insert into b values(1, 'baroda'), (2, 'surat');


drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare exit handler for sqlexception
	begin
		rollback;
		select "Rollback done";
	end;
	start transaction read write;
		insert into a values(2, 'ruhan');
		insert into b values(33333, 'bharuch');
	commit;
	
	select "DOne...";
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1(x int)
begin
	declare exit handler for 1062 select "invalid....";
	insert into dept(deptno) values(x);
end $
delimiter ;



drop procedure if exists display;
delimiter $
create procedure display(msg varchar(1000))
begin
	select msg;
end $
delimiter ;

drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare exit handler for 1050 call display('AP');
	create table zzz(c1 int);
end $
delimiter ;








drop procedure if exists pro1;   (INvalid)
delimiter $
create procedure pro1(x5 varchar(64))
begin
	select * from x5;
end $
delimiter ;

	



drop procedure if exists pro1; 
delimiter $
create procedure pro1(cName varchar(6000), tName varchar(64))
begin
	set @a := concat("select ", cName,  " from ", tName);
	prepare stat from @a;
	execute stat;end $
delimiter ;



DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1((IN tName VARCHAR(64), IN colLists TEXT, IN valLists TEXT))
begin
    set @x := CONCAT('INSERT INTO ', tName, ' (', colLists, ') VALUES (', valLists, ') ');

    PREPARE STMT FROM @x;
    EXECUTE STMT;
end $
delimiter ;


DROP PROCEDURE IF EXISTS procedurename;
delimiter $
CREATE PROCEDURE pro1(IN tName VARCHAR(64))
begin
    declare colList TEXT;

    SELECT GROUP_CONCAT(CONCAT("`", COLUMN_NAME, "`")) INTO colList FROM information_schema.columns  
        WHERE TABLE_SCHEMA = 'db1'  AND TABLE_NAME = tName;

    set @sql := CONCAT('SELECT ', colList, ' FROM ', tName);

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
end $
delimiter ;





DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1()
begin
	declare x int default 1;
    lbl:loop
		select x;
		set x := x + 1;
		if x > 10 then
			leave lbl;
		end if;
	end loop lbl;
end $
delimiter ;



DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1()
begin
	declare _deptno int; 
	declare _DNAME, _LOC, _PWD, _STARTEDON varchar(20);
	declare c1 cursor for select * from dept;
	declare exit handler for 1329 call display('no more rows');
	open c1;
	  lbl:loop
		fetch c1 into _deptno,_DNAME, _LOC, _PWD, _STARTEDON;
		if _deptno = 20 then
		   select _deptno,_DNAME, _LOC, _PWD, _STARTEDON;
		end if;	
	  end loop lbl;
	close c1;	
end $
delimiter ;




DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1()
begin
	declare _deptno int; 
	declare _DNAME, _LOC, _PWD, _STARTEDON varchar(20);
	declare c1 cursor for select * from dept;
	declare exit handler for 1329 call display('no more rows');
	open c1;
	  lbl:loop
		fetch c1 into _deptno,_DNAME, _LOC, _PWD, _STARTEDON;
		if _deptno = 10 then
		  insert into d10 values(_deptno,_DNAME, _LOC, _PWD, _STARTEDON);
		elseif _deptno = 20 then
		  insert into d20 values(_deptno,_DNAME, _LOC, _PWD, _STARTEDON);
		else
			insert into dall values(_deptno,_DNAME, _LOC, _PWD, _STARTEDON);
		end if;	
	  end loop lbl;
	close c1;	
end $
delimiter ;






DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1(x int)
b1:begin
      
 if (select true from dept where deptno = x) then
	b2:begin
		
	  declare _ename varchar(20);
	  declare _deptno int;
	  declare c1 cursor for select ename, deptno from emp;
	  
	  declare exit handler for 1329 call display('done');
	  open c1;
	     lbl:loop
			fetch c1 into _ename, _deptno; 
			  if _deptno = x then
				call display(concat(_ename, ", ", _deptno ));
			   end if;
		 end loop lbl;
	end b2;
  else
  
  select "not ok";
 end if;
 
end b1 $
delimiter ;

DROP TRIGGER IF EXISTS tr1;
delimiter $$
CREATE TRIGGER tr1 after INSERT ON temp FOR EACH ROW
begin
   INSERT INTO temp1 VALUES(NEW.c1);
end $$
delimiter ;

















DROP function IF EXISTS fn1;
delimiter $
CREATE function fn1() returns varchar(20)
deterministic
begin
	declare x varchar(20);
	 select 'hello world'; ----invalid stat 
	 select 'hello world' into x ; ----valid stat 
	
	return 'hello world';
end $
delimiter ;




DROP function IF EXISTS fn1;
delimiter $
CREATE function fn1(x int, y int) returns int
deterministic
begin
	return ifnull(x, 0) + ifnull(y, 0);
end $
delimiter ;






DROP function IF EXISTS fn1;
delimiter $
CREATE function fn1(x int) returns varchar(10)
deterministic
begin
	declare y bool default false;
	declare z varchar(10);
	select true into y from dept where deptno = x;
	set z := case when y = 0 then 'False' else 'True' end;
	return z;
end $
delimiter ;






DROP function IF EXISTS fn1;
delimiter $
CREATE function fn1() returns int
deterministic
begin
	declare x int default 0;
	select max(deptno) + 1 into x from dept;
	return x;
end $
delimiter ;





DROP function IF EXISTS fn2;
delimiter $
CREATE function fn2(x int, y int) returns int
deterministic
begin
	return ifnull(x, 0) + ifnull(y, 0);
end $
delimiter ;




DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1(x int, y int)
begin
	select ename from emp limit x, y;
end $
delimiter ;



DROP function IF EXISTS db1.sum;
delimiter $
CREATE function db1.sum(x int, y int) returns int
deterministic
begin
	return x + y;
end $
delimiter ;

DROP function IF EXISTS x.sum;
delimiter $
CREATE function x.sum(x int, y int, z int ) returns int
deterministic
begin
	return x + y + z;
end $
delimiter ;





DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 after insert on dept for each row  

begin
	select 'saleel' into @x;
end $
delimiter ;




DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 after insert on dept for each row  
begin
	insert into d10 values(new.DEPTNO,new.DNAME, new.LOC,  new.PWD, new.STARTEDON, user(), now());
end $

delimiter ;


 mysql> insert into dept values(61,61,61,61, 61); enter 


  new.DEPTNO = 61
  new.DNAME= 61
  new.LOC= 61
  new.PWD= 61
  new.STARTEDON = 61




DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 after delete on dept for each row  
begin
	insert into d10 values(old.DEPTNO,old.DNAME, old.LOC,  old.PWD, old.STARTEDON, user(), now());
end $
delimiter ;

mysql> insert into dept(deptno)  values(100); invalid
mysql> insert into dept(deptno)  values(21); valid


DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 after insert on dept for each row  
begin
	if new.deptno >= 100 then
		signal sqlstate '45000' set message_text ='ulks';
	end if;
end $
delimiter ;



DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 before insert on dept for each row  
begin
	if new.deptno <= 0 then
	    set new.deptno = 98;
    end if;
end $
delimiter ;



create table  w1 (c1 int primary key AUTO_INCREMENT, c2 int);
create table  w2 (c1 int );

mysql> insert into w1 values(default, 111);
0


DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 after insert on w1 for each row  
begin
	insert into w2 values(new.c1);
end $
delimiter ;


drop table w1, w2;
create table w1(c1 varchar(10));
*/

DROP trigger if EXISTS tr1;
delimiter $
CREATE trigger tr1 before insert on w1 for each row  
begin
	set new.c1 := upper(new.c1);
end $
delimiter ;


































