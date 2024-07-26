create table age_group(
age_group_id number(5) primary key,
age_min number(3),
age_max number(3),
age_range number(3));

insert all
into age_group values(10001,10,20,10)
into age_group values(10002,20,30,10)
into age_group values(10003,30,50,20)
into age_group values(10004,50,70,20)
into age_group values(10005,70,100,30)
into age_group values(10006,100,130,30)
into age_group values(10007,130,170,40)
into age_group values(10008,170,210,40)
select * from dual;

create table country1(
country_id number(5) primary key,
country varchar(20));

insert all
into country1 values(20001,'india')
into country1 values(20002,'australia')
into country1 values(20003,'england')
into country1 values(20004,'america')
select * from dual;

create table region(
region_id number(5) primary key,
region varchar(20),
country_id number(5),
foreign key(country_id) references country1(country_id));

insert all 
into region values(30001,'south india',20001)
into region values(30002,'victoria',20002)
into region values(30003,'north india',20001)
into region values(30004,'queensland',20002)
into region values(30005,'london',20003)
into region values(30006,'the plains',20004)
into region values(30007,'midlands',20003)
into region values(30008,'the mideast',20004)
select * from dual;


create table resort1(
resort_id number(5) primary key,
resort varchar(20),
country_id number(5),
foreign key(country_id) references country1(country_id));

insert all
into resort1 values(40001,'taj Club',20001)
into resort1 values(40002,'haven',20003)
into resort1 values(40003,'mahindra',20001)
into resort1 values(40004,'blue harbor',20004)
into resort1 values(40005,'rubens',20003)
into resort1 values(40006,'taj Metro',20001)
select * from dual;

create table city2(
city_id number(5) primary key,
city varchar(20),
region_id number(5),
foreign key(region_id) references region(region_id));

insert all 
into city2 values(50001,'bangalore',30001)
into city2 values(50002,'hyderabad',30001)
into city2 values(50003,'kochi',30001)
into city2 values(50004,'delhi',30003)
into city2 values(50005,'madurai',30001)
into city2 values(50006,'jaipur',30003)
into city2 values(50007,'mysore',30001)
into city2 values(50008,'agra',30003)
into city2 values(50009,'chennai',30001)
select * from dual;

create table service_line(
sl_id number(5) primary key,
service_line number(3),
resort_id number(5),
foreign key(resort_id) references resort1(resort_id));

insert all
into service_line values(60001,102,40001)
into service_line values(60002,999,40002)
into service_line values(60003,103,40003)
into service_line values(60004,789,40004)
into service_line values(60005,107,40006)
select * from dual;

create table service(
service_id number(5) primary key,
service_name varchar(20),
price number(5),
sl_id number(5),
foreign key(sl_id) references service_line(sl_id));

insert all
into service values(70001,'buffet service',45000,60001)
into service values(70002,'self service',95000,60003)
into service values(70003,'buffet service',14520,60003)
into service values(70004,'waiter service',98752,60001)
into service values(70005,'self service',78542,60002)
into service values(70006,'chinese service',22245,60001)
into service values(70007,'waiter service',34569,60005)
into service values(70008,'no service',74585,60003)
select * from dual;

create table customer2(
cust_id number(5) primary key,
first_name varchar(10),
last_name varchar(10),
phone_no number(10),
address varchar(20),
age_group_id number(5),
city_id number(5),
foreign key(age_group_id) references age_group(age_group_id),
foreign key(city_id) references city2(city_id));

insert all
into customer2 values(80001,'tim','stan',9887410256,'jayanagar',10001,50001)
into customer2 values(80002,'clark','kent',9887410356,'mysore zoo',10002,50007)
into customer2 values(80003,'bill','bucky',9887410456,'jp nagar',10003,50001)
into customer2 values(80004,'peter','parker',9887400256,'charminar',10004,50002)
into customer2 values(80005,'bruce','wayne',9887490256,'dilli haat',10005,50004)
into customer2 values(80006,'barry','allen',9887260256,'jew town',10006,50003)
into customer2 values(80007,'hal','jordon',9887470256,'marina beach',10007,50009)
into customer2 values(80008,'diana','prince',9888810256,'meenakshi temple',10008,50005)
into customer2 values(80009,'tony','stark',9887987256,'hawa mahal',10003,50006)
select * from dual;

create table reservation(
res_id number(5) primary key,
res_date date,
cust_id number(5),
foreign key(cust_id) references customer2(cust_id));

insert all
into reservation values(90001,'19-may-2022',80005)
into reservation values(90002,'25-jun-2022',80006)
into reservation values(90003,'16-apr-2021',80007)
into reservation values(90004,'8-jan-2016',80001)
into reservation values(90005,'7-feb-2018',80002)
into reservation values(90006,'30-aug-2019',80009)
select * from dual;

create table reservation_line(
future_guests number(3),
res_days number(3),
res_id number(5),
service_id number(5),
foreign key(res_id) references reservation(res_id),
foreign key(service_id) references service(service_id));

insert all 
into reservation_line values(110,20,90002,70001)
into reservation_line values(200,15,90005,70006)
into reservation_line values(20,17,90006,70002)
into reservation_line values(300,18,90001,70008)
into reservation_line values(250,30,90004,70004)
select * from dual;


1.0 Find out the resorts where both customer  Tim  and customer  Bill  stayed;

select resort
from resort1 r1,city2 c2,region r,country1 c1,customer2 C
where C.city_id=c2.city_id and c2.region_id=r.region_id and r.country_id=c1.country_id and c1.country_id=r1.country_id and
C.first_name='tim' and C.first_name='bill';

2.0 Find out the services which are available in the resort  Taj Club  but not in  Taj Metro ;

select service_name
from service s,resort1 r,service_line s1
where r.resort_id=s1.resort_id and s1.sl_id=s.sl_id and resort='taj Club' and resort<>'taj Metro';

3.0 Display customer name, age group, city, region and country who has reserved  self services ;

select distinct c.first_name||' '||c.last_name as name,c.age_group_id,c1.city,r.region,c2.country
from customer2 c,city2 c1,region r,country1 c2,service s,service_line s1,resort1 r1
where  s.sl_id=s1.sl_id and s1.resort_id=r1.resort_id and r.country_id=c2.country_id and c2.country_id=r.country_id and
c1.region_id=r.region_id and c.city_id=c1.city_id and s.service_name='self service';

4.0 Write a query to find customers who are aged between 60 and 70 and who have
reservation in the next month in India resorts;

select c.first_name||' '||c.last_name as name
from customer2 c,age_group a,reservation r
where c.age_group_id=a.age_group_id and c.cust_id=r.cust_id and age_min between 60 and 70 and to_char(res_date,'mon-yyyy')=to_char(add_months(sysdate,1),'mon-yyyy');

5.0 Display the regions where we have more than 2 cities;

select region
from region r,city2 c
where r.region_id=c.region_id 
group by region
having count(c.city_id)>=2;

6.0 Display age group wise customer count;

select age_range,count(cust_id)
from customer2 c,age_group a
where c.age_group_id=a.age_group_id
group by age_range;

7.0 Display resort_name, resort_country,customer_name and customer_country based on
the reservations table;

select A.country,A.resort,B.name,B.country
from (select country,resort,rownum r
from country1 c,resort1 r
where c.country_id=r.country_id) A,
(select first_name||' '||last_name as name,country,rownum r1
from customer2 c,reservation r,city2 c1,region r1,country1 c2,resort1 r2
where c.cust_id=r.cust_id and c1.city_id=c.city_id and c1.region_id=r1.region_id and c2.country_id=r1.country_id and c2.country_id=r2.country_id) B
where A.r=B.r1;

8.0 What is the costliest service in each service_line? Display the result which displays service_name,
price, maximum_price with in the service line;

select A.service_line,A.price,A.service_name,A.maximum_price
from(select service_line,price,service_name,max(price)as maximum_price,rownum r
from service s,service_line s1
where s.sl_id=s1.sl_id
group by service_line,price,service_name,rownum) A
where A.r=1;

9.0 Display country_name, number of regions and number of cities for each country;

select c.country,count(r.region_id),count(c1.city_id)
from country1 c,region r,city2 c1
where c.country_id=r.country_id and c1.region_id(+)=r.region_id
group by country;

10.0 Display the number of reservations we have based on each resort;

select resort,count(r.res_id) count
from reservation r,reservation_line r1,service s,service_line s1,resort1 r1
where r.res_id=r1.res_id and r1.service_id=s.service_id and s.sl_id=s1.sl_id and
s1.resort_id = r1.resort_id
group by resort;


select * from reservation;
select * from reservation_line;
select * from customer2;
select * from resort1;
select * from service;
select * from service_line;
select * from city2;
select * from region;
select * from country1;
select * from age_group;

