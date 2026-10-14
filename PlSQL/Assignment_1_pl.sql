/*
drop procedure if exists addUser;
delimiter $
create procedure addUser(user varchar(40),pass varchar(40),email varchar(40))
begin 
	insert into LoginTable values(user,pass,email);
end $
delimiter ;
*/

drop procedure if exists checkUser;
delimiter $
create procedure checkUser(em varchar(40))
begin
	if(select TRUE from logintable where email = em)
		then select username,password from logintable where email=em;
	else
		insert into log (curr_date,curr_time,message) values(curdate(),curtime(),'hello');
	end if;

end $
delimiter ;