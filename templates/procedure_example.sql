drop procedure if exists perevod ;
delimiter //
create procedure perevod(in empl_id int, in dept_new char(4),in hire_date_p date)
begin
declare exit handler for sqlexception
	begin
		rollback;
        select 'что то пошло не так';
	end;
     start transaction;
        if( hire_date_p is null ) then set hire_date_p=curdate();
			end if;
        UPDATE dept_emp SET to_date = hire_date_p WHERE (emp_no = empl_id) and (to_date = '9999-01-01');
        insert dept_emp set emp_no=empl_id, dept_no=dept_new,from_date =hire_date_p,to_date='9999-01-01';
	 commit;
end//
delimiter ;

call perevod(10001,'d010',null);

