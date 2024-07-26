create database aroha9;
use aroha9;
create table productpro
(prod_id int primary key,
prod_name varchar(20) not null,
p_price int not null,
prod_cat varchar(20) not null,
sku int not null);
select * from productpro;
insert into productpro values(100, "PENCIL", 50, "STATIONARY", 12384948),
(101,	"MOBILE COVER"	,500,"ELECTRONICS",	846754534),
(102, "PEN SET",500,"STATIONARY",	84950510),
(103,	"ELE POINTER"	,1000,"ELECTRONICS",583033011);



select *  from productpro;

#category wise  number of products
select count(prod_id),prod_cat
from productpro
group by prod_cat;

#productname and category where price is between 455 and 1100
select prod_name,prod_cat 
from productpro
where p_price between 455 and 1100;

#Disply the costilest product name from produt
select max(p_price)
from productpro;

#Disply the costilest product name from produt
select prod_name
from productpro 
where p_price =(select max(p_price) from productpro);
#Display  the costilest product in each catrgory
select prod_cat,max(p_price),prod_name
from productpro
group by prod_cat;

select prod_cat,p_price,prod_name
from productpro p1
where p_price=(select max(p_price) from productpro p2
where p1.prod_cat=p2.prod_cat);

update productpro
set p_price=600 
where prod_id=102;

select * from productpro;