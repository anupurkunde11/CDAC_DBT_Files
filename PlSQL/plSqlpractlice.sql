drop procedure if exists pro;
delimiter $
create procedure pro()
begin
	select 'Hello World';
end $
delimiter ;