-->2
declare @bday date set @bday='2004-08-19';
select datediff(year,@bday,getdate()) - case 
when month(@bday)>month(getdate()) or 
month(@bday)=month(getdate()) and day(@bday)>day(getdate())
then 1 else 0 end;

--1
declare @ip varchar(50)='2irh8ry47gfbceide8';
declare @i int=1;
declare @c varchar;
declare @res varchar(50)='';
while @i<=len(@ip)
begin
    set @c=substring(@ip,@i,1);
     if @c like '[0-9]'
         set @res=@res+@c;
    set @i=@i+1;
end;
select @res;

-->3
create table Employees (
    empid int primary key,
    empname varchar(50),
    noselect as 1/0
);
alter table Employees add errorcol as cast(empname as int);
insert into Employees values(3,'efgh');
select * from Employees;
select empid,empname from Employees;

-->4
declare @d date set @d='2004-12-31';
select datepart(dayofyear,@d) as Day_of_Year,datepart(week,@d) [week_number],
datepart(weekday,@d) as Week_Day,
datepart(month,@d) as month_number,datepart(day,@d) as day_no;

create table EmployeeForCTE(
    empid int primary key,
    empname varchar(30),
    managerid int null
);
insert into EmployeeForCTE values(1,'vilva',null),(3,'m1',1),(4,'e1',3),(2,'e2',4);
select * from EmployeeForCTE;

--> 5
with heirarchy as(
select empid,empname,managerid,1 as hlevel 
from employeeforcte where managerid is null

union all

select e.empid, e.empname, e.managerid, h.hlevel + 1
from Employeeforcte as e
inner join heirarchy as h 
on h.empid = e.managerid
)
select * from heirarchy;
select * from EmployeeForCTE;