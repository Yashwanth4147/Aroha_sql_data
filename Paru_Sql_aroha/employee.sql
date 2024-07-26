use aroha;
create table employee
(emp_no int ,
ename varchar(20),
deptno int ,
sal int,
job varchar(20),
comm int,
city varchar(20),
join_date date);

drop table employee;
insert into employee values(1010,"TIM",10,7500,"CLEARK",500,"BENGALURU","2020/2/1"),
(1011,"BILL",10,8000,"MANAGER",NULL,"BENGALURU","2020/3/1"),
(1012,"RAMA",20,6900,"CLEARK",300,"BENGALURU","2019/3/3"),
(1013,"MARA",20,9000,"MANAGER",NULL,"BENGALURU","2019/4/4");
#insert into employee values(1014,"ARAM",10,4500,"CLEARK","   ","BENGALURU","2020/2/2");
select * from employee;



#1. Select employee numbers, employee names from employee table.
select emp_no,ename
from employee;
#2. Select employee numbers grater than 1010.
select emp_no
from employee
where emp_no>1010;
#3. Select employee number, employee name who draws more than 2000 as the Salary.
select emp_no,ename
from employee
where sal>2000;
#4. Select employee number, sal, comm for department 20.
select emp_no,sal,comm
from employee 
where deptno=20;
#5. Select employee names who were getting salary greater than 1500.
select ename
from employee
where sal>1500;
#6. Select all the employees whose job = 'CLERK'.
select ename
from employee
where job="CLEARK";
#7. Select all the employees whose job = 'CLERK' and salary > 2000.
select ename
from employee 
where job="CLEARK" and sal>2000;
#8. Select employee number, name who works in deptno 30 and name starts with 'K
select emp_no,ename
from employee
where deptno=30 and ename like "k%";
#9. Display different deptno we have in the employee table
select distinct(deptno)
from employee;
#10. Select employee number, name, sal, comm who works in deptno 10, salary greater than 2000 and comm less than 250.
select emp_no,ename,sal,comm
from employee
where deptno=10
and sal>2000 and
comm <250;


select ename,year(join_date)
from employee
where year(join_date)=year(curdate() -interval 1 year);

select * from employee;

select count(emp_no) as no_of_employees,year(join_date)
from employee
group by year(join_date);