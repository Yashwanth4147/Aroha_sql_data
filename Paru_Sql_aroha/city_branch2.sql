use aroha;
create table citycity(city_id int primary key,city_name varchar(20),city_pop int);

insert into citycity values 
(10,"Bengaluru",2367890),
(20,"Chennai",6474836),
(30,"Mumbai",78393739);

select * from citycity;
drop table cityc;
create table branchb(b_id int primary key,b_name varchar(20),b_address varchar(20),b_phone int,
city_id int ,foreign key(city_id) references cityc(city_id) );
select * from branchb;
drop table branch;
insert into branchb values(500,"BTM Layout","185 RingRoad",7890874,10),
(501,"Jaynagar","44 -15th main",8909748,10),
(502,"Ashok Nagar","AshokPillar",8948599,20),
(503,"Mount Road","Nandaum",8393839,20);

#1.	Write a query to list the cities which have more population than Bangalore.
select * from citycity;
select city_name 
from citycity
where city_pop>(select city_pop from city where city_name="Bengaluru");
#2.	Display all the branch names from Chennai.
select * from branchb;
select * from citycity;
Select b_name
From branchb b,citycity c
Where b.city_id=c.city_id
And city_name='Chennai';

#3.	Display a city name which does not have any branches
select city_name
from citycity
where city_id not in (select city_id from branchb);
#4.	Display branch name, address and phone number of all the branches where the name starts with either B or M and the city name starts with either B or C.
select * from branch;
select b_name,b_address,b_phone
from cityc c,branch b
where c.city_id=b.city_id and
(b_name like 'B%' OR b_name like 'M%')
and (city_name like 'B%' OR city_name like 'C%');
#5.	How many branches we have in Bangalore?
select count(b_id) 
from branchb
where city_id=(select city_id from citycity where city_name ='Bengaluru');
#6.	Display the branches which are in the Ring road of any city.
select * from branchb;
select b_name
from branchb b,citycity c
where b.city_id=c.city_id and  
b_address='185 RingRoad'
group by city_name;
#7.	Display the city name, branch name. Order the data based on the city name.
select city_name,b_name
from branchb b,citycity c
group by city_name;
#8.	Display the city name and the number of branches in each city.
select city_name,count(b_id)
from branchb b,citycity c
where b.city_id=c.city_id
group by city_name;
#9.	Display the city name which has most number of branches.

#10.	Display the city name, population, number of branches in each city.
select * from citycity;
select city_name,city_pop,count(b_id)
from branchb b ,citycity c
where b.city_id=c.city_id
group by city_name;
 select week(curdate()+interval - 3 week);
