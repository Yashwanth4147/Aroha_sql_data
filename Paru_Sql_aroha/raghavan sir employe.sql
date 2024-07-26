use pvb;
create table employees
(employee_id decimal(6,0) not null,
first_name varchar(20) default null,
last_name varchar(25) not null,
email varchar(25) not null,
phone_number varchar(20) default null,
hire_date date not null,
job_id varchar(20) not null,
salary decimal(8,2) default null,
commission_pct decimal(2,2) default null,
manager_id decimal(6,0) default null,
department_id decimal(4,0) default null);
drop table employees;

insert into employees values
(111111,"parvati","bhrungi","parvathi@gmail.com","8095871232","2012/3/1","1bi17mca82","150000.23",".22",000001,1000),

(222222,"akku","bhru","akku.bhru2@gmail.com","9449534934","1994/11/17","1bi17mca83","200000.78",".33",000002,2000),

(333333,"veeranna","doddappa","verna26@gmail.com","9448946825","1899/4/26","1bi17mca84","250000.12",".44",000003,3000),

(444444,"manjunath","veeru","manju3774@gmail.com","7829041574","1991/10/8","1bi17mca85","309867.34",".55",000004,4000),

(555555,"shobha","kamatar","anushka@gmail.com","8095871235","1990/8/25","1bi17mca86","350900.87",".66",000005,5000),

(666666,"manju","kamat","manjukamatar@gmail.com","3234567874","1885/4/14","1bi17mca87","400000.76",".77",000006,6000),

(777777,"rishit","shivarayappa","rishit7jan@gmail.com","1234567890","2001/1/9","1bi17mca88","450000.35",".88",000007,7000),

(888888,"rithvik","shivu","rithvikdadmom@gmail.com","9876504321","2012/5/23","1bi17mca89","500000.87",".99",000008,8000),

(999999,"poorvika","bhrungimanju","priyanka@gmail.com","6750931244","1994/3/12","1bi17mca90","555555.90",".11",000009,9000),

(123456,"paapu","mudhool","newborn@gmail.com","7893249081","2003/11/19","1bi17mca91","600000.51",".09",000010,1234);

desc employees;
select * from employees;

alter table employees
add dob date not null;
select * from employees;

update employees
set dob="1994/11/17"
where employee_id=111111;

desc employees;
update employees
set dob="1898/4/1"
where employee_id=222222;


update employees
set dob="1888/4/26"
where employee_id=333333;


update employees
set dob="1997/10/5"
where employee_id=444444;

update employees
set dob="2002/7/26"
where employee_id=555555;

update employees
set dob="2012/12/19"
where employee_id=666666;

update employees
set dob="1778/1/15"
where employee_id=777777;

update employees
set dob="1994/6/29"
where employee_id=888888;

update employees
set dob="2009/9/7"
where employee_id=999999;

update employees
set dob="1857/02/28"
where employee_id=123456;

desc employees;
select * from employees;

#WAQTD firstday of the month (in date time formate) three months beforecurrent_month.
select date_add((last_day(cur_date)-interval(month)),interval 1 day) as firstday,date_add((last_day(cur_date)-interval 3 month)),interval 1 day);

#WAQTD the llast day of the month three months before the current month
select last_day(curdate()),lastday(curdate()-interval 3 months);

# 3) WAQT get the distinct monday from hire_date in employee table.
select distinct(hire_date)
from employees
where dayname(hire_date)="monday";

# 4) WAQT get the first day of current year
select makedate(year(curdate()),1);

# 5)WAQT get the last day of current year
select makedate(year(curdate()),1)+interval 1 year-interval 1 day;

# 6) WAQTD age in year
select (round(datediff(curdate(),dob))/365)as age;

# 7) WAQT get the current date in the folling formate:
select concat(monthname(curdate()),'',day(curdate())),year(curdate());

# 8) WAQT get the current date in thursday september 2014 formate.alter
select concat(dayname(curdate()),'',monthname(curdate()),'',year(curdate()));

# 9) WAQTD year from curdate 
select year(curdate());

# 10) WAQTD the first name hiredate from employees table where hiredate between -------------.
select first_name,hire_date
from employees where 
hire_date>"1855/2/23" and hire_date<"2012/9/12";

select * from employees;

#11) WAQTD the current date in the following format

select date_format(now(),'%W %D %M %Y %H:%M:%S');

# 12)WAQTD current date in the following format

Select date_format(now(),'%W %D %M %Y %H:%M:%S');

# 13)WAQTD the curdate in the following format

select date_format(now(),'%I %P %B %D %P %I');

# 14th) WAQTD firstname,lastname,who joined in the month of june

select first_name,last_name
from employees
where monthname(hire_date)="june";
drop table employees;
select * from employees;

# 16th) WAQTD firstname of the employees who joined in the year 2000

select first_name
from employees
where year(hire_date)=2000;

update employees
set hire_date="2000/12/1"
where employee_id=444444;

#17th) 

select employee_id,last_name,lastday(hire_date) as date of first_salary
from employees;

#18th) WAQT get the first_name,hiredate & experience of the employees

select first_name,hire_date,(round(datediff(curdate(),hire_date)))/365
as experience from employees;

select makedate(year(curdate() + interval 1 year),1);

select date_sub(curdate() , interval dayofyear(curdate())  day )+interval 2 year;

select date_sub(curdate(), interval dayofyear(curdate()) day);

select date_sub(curdate() , interval dayofyear(curdate())  day ) + interval 2 year;

select last_day(curdate());
select date_sub(curdate(),interval dayofmonth(curdate());

select last_day(curdate() +interval 1 month);
select date_sub(curdate(),interval dayofweek(curdate()) -1 day);


select date_add(curdate() , interval dayofweek(curdate()) - 2 day);

select date_sub(curdate(), interval dayofweek(curdate()) day) + interval 1 week + interval 1 day;

#select curdate() as date;
#select curtime();
#select current_timestamp();
#select Dayofmonth();
#select dayofweek();
#select to_days('1994/6/21');
#select last_day('2021/3/17');
#select maketime(15,9,33);

select cust_name from customer
where cust_dob=(select max(dob) from customer) and dob=(select min(dob) from customer);