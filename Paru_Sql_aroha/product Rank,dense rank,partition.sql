create database aroha9;
use aroha9;
create table product
(prod_id int primary key,
prod_name varchar(20) not null,
p_price int not null,
p_cost int not null,
p_family varchar(20) not null);
insert into product values(100,	"KEYBOARD"	,1000,	800	,"COMPUTERS"),
(101,	"WIRELESS MOUSE"	,1500,	900,	"COMPUTERS"),
(102,	"CHAIR",		2000,	1800,	"FURNITURE"),
(103,	"MONITOR"	,	2000	,1700,	"COMPUTERS"),
(104	,"TABLE"	,	3000	,1900	,"FURNITURE");
select * from product;
select 
	prod_name, 
	p_price, 
	avg_price,
	Case WHEN p_price > avg_price THEN "ABOVE AVERAGE"
	     WHEN p_price < avg_price THEN "BELOW AVERAGE"
	     ELSE "EQAUL TO AVERAGE"
	END as Status
from 
	product,
	(select avg(p_price) avg_price from product) temp
    
    
    select
	prod_name,
	p_cost,
	p_price,
	Rank() OVER ( ORDER BY p_price DESC ) 
from 
	product


