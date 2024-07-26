
create database aroha;
use aroha;
create table city
(city_id int primary key,
city_name varchar(20) not null);
insert into city values
(21,"bangalore"),
(22,"mangalore"),
(33,"chikkamagaluru"),
(44,"orisa"),
(55,"tamilnadu"),
(66,"chennai"),
(77,"orisa"),
(88,"chennai");
drop table city;
select * from city;
create table customer2
(cust_id int  primary key,
c_name varchar(20) not null,
dob date not null,
join_date date not null,
gender varchar(10) not null,
mar_status varchar(20) not null,
phone varchar(20) ,
email varchar(20) not null,
city_id int ,foreign key(city_id) references city(city_id));
insert into customer2 values
(1,"srujan","2008/04/2","2018/3/12","male","married","9087654324","sru@gmail.com",44),
(2,"varsha","2010/03/4","2018/05/22","female","unmarried","2345678712","varsha@gmail.com",66),
(3,"vinuta","2020/11/12","2014/06/17","male","married","","vinuta12@gmail.com",88),
(4,"lakshmi","1997/07/23","1994/11/17","female","married","5682672897","lakki@gmail.com",77),
(5,"renu","2001/04/23","2010/07/29","female","married","","renu2@gmail.com",33),
(6,"giri","1857/03/28","2013/05/5","male","unmarried","6721903764","giri57@gmail.com",44),
(7,"mike","1997/05/23","2005/07/20","male","unmarried","1298745306","mike32@gmail.com",22),
(8,"jhon","1853/09/26","1867/08/27","male","married","9854728450","jhonoo@gmail.com",21);
drop table customer2;
select * from city;
select * from customer;
desc customer2;
#Display cust names and their age in years.
select  c_name,year(curdate())-year(dob)
from customer2;
 #display customer names who are from the same city of mike
select city_name 
 from city
 where city_id in(select city_id from customer2 where c_name like "mike");
 select * from customer2;
 
 #display customers who are younger than mike.
 select c_name from customer2
 where dob <(select dob from customer2 where c_name like "mike");
 use aroha;
 
 
 #display customer names who are male and are from bangalore.
 select c_name from customer2
 where gender="male" and 
 cust_id in(select cust_id from city where c_name like"bangalore");
 
 # display customer names from chennai who donot have a phone.
 select * from customer2;
 select * from city;
 select c_name from customer2
 where city_id in(select city_id from city where city_name = "chennai")
 and phone="";
  select * from customer2;
 update  customer2
 set 
 c_name="giri",
 dob="1857/03/28",
 join_date="2013/05/5",
 gender="male",
 mar_status="unmarried",
 phone="",
 email="giri57@gmail.com",
 city_id=44 where cust_id=6;
select * from customer2;

#display the customer names who are from the same city of jhon and their age is less than jhon

select city_name
from city where
city_id in(select city_id from customer2 where c_name="jhon");

select * from customer2;
# display customer names who have their email in gamil.
select c_name from customer2
where email  like "%gmail%";
update customer2
set email="lakki@yahoo.com"
where cust_id=4;
select * from customer2;

#select cust name  age is less than 30 and are customers since a year.
select c_name
from customer2
where year(curdate())-year(dob)<30
and join_date between 

select course_n ,student name
from course c,student s
where c.course_id=s.course_id
and 


display the employee name whose employee id id same as bill
select employee_name
from employee
where employe_id=(select emply_id from employee where emp_name="bill);


dislpay the dept_id,dep_name,emp_name ---Inner join

display the dep_name ,emp_name 

















