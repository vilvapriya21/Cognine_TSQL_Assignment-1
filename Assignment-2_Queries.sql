-->1

select names
from namesound
where soundex(names) = soundex('Suresh')
order by difference(names,'suresh') desc;

-->2
select empname,salary from employee order by salary desc offset 1 rows fetch next 1 rows only;

with highest_2 as(
	select empid,empname,salary,dense_rank() over(order by salary desc) as dr
	from employee
)
select empid,empname,salary from highest_2 where dr=2;

-->3 
select * from employee;
with dept_high as(
	select department_name,salary,
	dense_rank() over(partition by department_name order by salary desc) as dn
	from employee
)
select department_name,salary from dept_high where dn=1;

-->4
create table numbers(number int);
insert into numbers values(7859),(6897),(9875),(8659),(7600),(7550);
select top(1) number from numbers order by number desc;

-->5

select employeeid,employeename from employeedetails 
where employeeid in (select managerid from employeedetails);
