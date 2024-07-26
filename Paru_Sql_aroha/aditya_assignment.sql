use aroha;
create table cust
(cust_id int  primary key,
c_name varchar(20) not null,
dob date not null,
join_date date not null,
gender varchar(10) not null,
mar_status varchar(20) not null,
phone varchar(20) ,
email varchar(20) not null);
drop table cust;
insert into cust values
(1,"srujan","2008/04/2","2018/3/12","male","married","9087654324","sru@gmail.com"),
(2,"varsha","2010/03/4","2018/05/22","female","unmarried","2345678712","varsha@gmail.com"),
(3,"vinuta","2020/11/12","2014/06/17","male","married","7897867656","vinuta12@gmail.com");

CREATE TABLE PRODUCTPP
( P_ID INT,
 P_NAME VARCHAR(20), 
 P_FAMILY VARCHAR(20),
 PRICE INT,
 COST INT ,
 LAUNCHED_DATE DATE );
INSERT INTO PRODUCTPP VALUES
(100,'MAKER','STATIONARY',25,22,'2008/1/15') ,
(101,'MOUSE','COMPUTER',450,350,'2009/4/16'), 
(102,'WHITE_BOARD','STATIONARY',450,375,'2010/8/20'), 
(103,'SONY VAIO','COMPUTER',35000,42000,'2010/9/21') ;

update  productpp
set launched_date="2021/2/12"
where p_id=102;
create table sales1
(sales_ID numeric(10) primary key,
sales_date date,
sales_Quty numeric(10) not null,
customer_ID numeric(10)  references cust(cust_id),
p_ID numeric(10)  references productpp(p_ID));
drop table sales1;
desc sales1;
insert into sales1 values(107,"2021/2/3",21,1,101),
 (108,"2020/2/4",15,2,102),
(109,"2020/2/10",43,3,103),
(110,"2020/12/14",67,1,100),
(111,"2021/2/3",36,2,101);

select * from cust;
#1.	Query to display customers whose name starts with ‘A’ and ends with ‘E’
select c_name
from cust
where c_name like 'a%e';
#2.	Query to display products which were launched in the first quarter of the current year
select * from productpp;
select p_name
from productpp
where quarter(launched_date)=1
and year(launched_date)=year(curdate());

#3.	Query to display customers who made sales on their birthday
select * from cust;
select * from sales1;
Select c_name
From cust c,sales1 s
Where c.cust_id=s.customer_id
And month(sales_date)=month(dob);
update sales1
set sales_date="2010/3/4"
where sales_id=109;
select month(dob) from cust;
select month(sales_date) from sales1;


Select p_name
From productpp
Where price=(select min(price) from productpp);

#10.	Query to display female customers who are from Mumbai and have done sales on Monday of January month
select * from cust;
select * from sales1;
select c_name
from cust c ,sales1 s
where c.cust_id=s.customer_id and gender="female" and 
month(sales_date)="january" ;
select dayname();
select * from city;
Select city_name,max(dob)
From cust
Group by city_name;
select * from cust;
alter table cust
add city_name varchar(20);
update cust
set city_name="mumbai"
where cust_id=3;

#19.	Query to display customers who did not make any transactions in the past two months
select * from cust;
select * from sales1;
select * from productpp;
update cust
set dob="2021/2/3"
where cust_id=1;
#17.	Query to display products that are getting launched in the next  month
select p_name 
from productpp
where month(launched_date)=month(curdate() + interval 1 month)
and year(launched_date)=year(curdate());
select * from productpp;

#16.	Query to display female customers who made at least 15 transactions in the first 10 days of the current month
select * from cust;
select * from productpp;
select * from sales1;
update sales1
set sales_date="2021/6/5"
where sales_id=108;

select c_name,count(sales_id)
from cust c ,sales1 s
where c.cust_id=s.customer_id
and gender='female' and day(sales_date) between 1 and 10 and 
year(sales_date)=year(curdate())
group by c_name having count(sales_id)>=15;
####where=>both wil filetr condn,but based on table cant use aggregte fun in where clause we can use afr groupby
###having=>based on group it will filter
select day(sales_date) from sales1;

#15.	Query to display male customers who made 10 sales in the first 10 days of ‘June’
select c_name,count(sales_id)
from cust c,sales1 s
where c.cust_id=s.customer_id  and
year(sales_date)=year(curdate()) and 
month(sales_date)='June' and
day(sales_date) between 1 and 10 
group by c_name having count(sales_id)=10;

#3.	Query to display customers who made sales on their birthday
Select c_name
From cust c,sales1 s
Where c.cust_id=s.customer_id and
Day(sales_date)=day(dob) and
Month(sales_date)=month(dob);

select dayname(sales_date)  from sales1;
select sales_id
from sales1
where dayname(sales_date)='wednesday';

#11.	Query to display customer name, first three characters of customer name as ‘customer_code’, gender ,product_name, product_category, first three characters of product_category as ‘category_code’
Select c_name as customer_code,gender,p_name,p_family as category_code
From cust c inner join sales1 s on c.cust_id=s.customer_id inner join productpp p on  s.p_id=p.p_id
and customer_code like '___'  and
category_code like '___' ;
select * from productpp;
select * from cust;
select * from sales1;
select  dayofweek(sales_date)=dayofweek(sales_date - interval 1 day) from sales1;

#19.	Query to display customers who did not make any transactions in the past two months
Select c_name
From cust c,sales1 s
where c.cust_id=s.customer_id and 
sales_id not in(select sales_id from sales1) and 
month(sales_date)=month(curdate() - interval 2 month) ;

select * from sales1;
insert into sales1 values(112,0,0,3,100);
update sales1
set sales_id='2021/5/12'
where sales_id=108;

select * from sales1;
select month(sales_date) from sales1;

select adddate(curdate(),interval 1 month);
select addate(month(curdate() - interval 3 month) from sales1;
select adddate(month(curdate() + interval 1 month);
select adddate(curdate() ,interval 1 month);------------------------------
select adddate(curdate(),interval 1 day);----------------------------------
select adddate(curdate(),interval 1 year);
#hour,day,month ,week
#join-->on -->filter--->where

select last_day(adddate(curdate(),interval -5 month)) from sales1;

select month(curdate() +interval 1 month);
select date_add(curdate(),interval -1 day);

#4.	Query to display customers who bought ‘Wireless Mouse’ on Friday of previous week
select c_name,cust_id
from cust c,sales1 s,productpp p
where c.cust_id=s.customer_id and s.p_id=p.p_id and 
cust_id=(select cust_id from productpp where p_name="mouse" ) and
  adddate(curdate(),interval -1 week) and
  day(sales_date)="monday" and
  year(sales_date)=year(curdate());
update productpp
set launched_date="2021/7/9"
where p_id=101;
select * from cust;
select * from sales1;
select * from productpp;






