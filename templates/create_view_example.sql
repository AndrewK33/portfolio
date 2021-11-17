select @@sql_mode; set @@sql_mode='';
/* формируем скрипт для создание представления view и тестируем */
select 
ee.emp_no,
ee.birth_date,
concat(ee.first_name,' ',ee.last_name) as full_name,
min('women') as gender, ## костыль, чтобы не вкл в группировку это поле
ee.hire_date,
min(if(d.to_date='9999-01-01',d.dept_no,'NO WORK')) tek_dept_no, ## текущий отдел тоже чтобы не включать в группировку
GROUP_CONCAT(DISTINCT t.title  ORDER BY t.emp_no ASC SEPARATOR ', ') title, ## все занимаемые долж-и
GROUP_CONCAT(DISTINCT d.dept_no  ORDER BY d.emp_no ASC SEPARATOR ', ') dept_no ## все отделы в которых работала
from
employees as ee
inner join titles t using(emp_no)
inner join dept_emp d using(emp_no) ## отделы
where ee.gender='F' 
group by ee.emp_no,
ee.birth_date,
full_name,
ee.hire_date;

select * from women_title_dept;

/* создание view */
create or replace view women_title_dept as 
select 
ee.emp_no,
ee.birth_date,
concat(ee.first_name,' ',ee.last_name) full_name,
'women' gender,
ee.hire_date,
min(if(d.to_date='9999-01-01',d.dept_no,'NO WORK')) tek_dept_no,
GROUP_CONCAT(DISTINCT t.title  ORDER BY t.emp_no ASC SEPARATOR ', ') title,
GROUP_CONCAT(DISTINCT d.dept_no  ORDER BY d.emp_no ASC SEPARATOR ', ') dept_no
from
employees ee
inner join titles t using(emp_no)
inner join dept_emp d using(emp_no)
where ee.gender='F'
group by ee.emp_no,
ee.birth_date,
full_name,
hire_date
;

/* тестирование */
select GROUP_CONCAT(DISTINCT d.dept_no  ORDER BY d.emp_no ASC SEPARATOR ', ') from dept_emp as d
where d.emp_no = 10010;