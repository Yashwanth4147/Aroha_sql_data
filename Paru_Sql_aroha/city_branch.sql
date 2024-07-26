use aroha;
create table cityc(city_id int primary key,city_name varchar(20),city_pop int);

insert into cityc values 
(10,"Bengaluru",2367890),
(20,"Chennai",6474836),
(30,"Mumbai",78393739);

select * from cityc;
drop table cityc;
create table branch(b_id int primary key,b_name varchar(20),b_address varchar(20),b_phone int,
city_id int ,foreign key(city_id) references cityc(city_id) );
select * from branch;
drop table branch;
insert into branch values(500,"BTM Layout","185 RingRoad",7890874,10),
(501,"Jaynagar","44 -15th main",8909748,10),
(502,"Ashok Nagar","AshokPillar",8948599,20),
(503,"Mount Road","Nandaum",8393839,20);

select * from branch;
select * from cityc;
#1.	Write a query to list the cities which have more population than Bangalore.
select city_name
from cityc
where city_pop>(select city_pop from cityc where city_name="Bengaluru");
#we dno wt is the population of blore so first get the population in one scan and then 

#2.	Display all the branch names from Chennai.
select b_name
from branch b,cityc c
where b.city_id=c.city_id
and city_name="Chennai";

select b_name
from branch
where city_id in(select city_id from city where city_name="Chennai");
#3.	Display a city name which does not have any branches
select city_name
from cityc  
where city_id not in (select city_id from branch);

Select city_name
From cityc 
Where city_id not in(select city_id from branch);

#4.	Display branch name, address and phone number of all the branches where the name starts with either B or M and the city name starts with either B or C.
select b_name,b_address,b_phone
from cityc c,branch b
where c.city_id=b.city_id and
(b_name like “B%” OR b_name like “M%”)
and (city_name like “B%” OR city_name like “C%”);
select * from cityc;
select * from branch;

#5.	How many branches we have in Bangalore?
Select count(b_id),b_name
From branch b,cityc c
Where b.city_id=c.city_id
And c.city_id=(select c.city_id from cityc where c.city_name =”Bengaluru”)
group by b_name; 

select count(b.city_id) ,b_name
From branch b,cityc c
Where b.city_id=c.city_id
and city_name="Bengaluru" 
group by b_name;
#6.	Display the branches which are in the Ring road of any city.
select b_name
from cityc c,branch b
where c.city_id=b.city_id
and b_address="185 RingRoad"
group by city_name;
select * from branch;
#7.	Display the city name, branch name. Order the data based on the city name.
select city_name,b_name
from cityc c,branch b
where c.city_id=b.city_id
group by city_name,b_name;
#8.	Display the city name and the number of branches in each city.
select count(b_id),city_name
from cityc c ,branch b
where c.city_id=b.city_id
group by city_name;
#9.	Display the city name which has most number of branches.
select city_name,count(b_id)
from cityc c,branch b
where c.city_id=b.city_id
group by city_name
having count(b_id)=(select max(a.m)
from(select city_name,count(b_id) m from branch b,cityc c
where c.city_id=b.city_id
group by city_name)a);
#10.	Display the city name, population, number of branches in each city.
select city_name,city_pop,count(b_id)
from cityc c,branch b
where c.city_id=b.city_id
group by city_name,city_pop;

select month(sysdate());
select week(sysdate());