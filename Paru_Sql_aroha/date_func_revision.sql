use retail_oltp;
select * from country;#no foreign key so parent
select * from city;
select * from state;
select * from country;
select * from customer
limit 5;
select quarter(curdate() + interval 2 quarter) ;
select *  from customer where customer_name="sara";
select customer_name
from customer
where year(curdate())-year(customer_dob) between 20 and 30;

select customer_name
from customer
where month(customer_dob)=month(curdate()+interval 1 month);

#we will get no.of days 
select dayofyear(curdate());
select date_sub(curdate() , interval dayofyear(curdate()) - 1 day ) as first_day;

select makedate(year(curdate() - interval 1 year),1) as 1st_day_of_previous_year;

select makedate(year(curdate() + interval 1 year),1);

select date_add(curdate(), interval dayofyear(curdate()) day);

select date_sub(curdate() , interval dayofyear(curdate())  day ) + interval 2 year;
select date_sub(curdate() , interval dayofyear(curdate())  day );

# month functions
select dayofmonth(curdate());

select date_sub(curdate() , interval dayofmonth(curdate())- 1 day) - interval 1 month;
select date_sub(curdate() , interval dayofmonth(curdate())- 1 day) + interval 1 month;
select day(curdate()); #day/month

select last_day(curdate());
select date_sub( curdate(), interval dayofmonth(curdate()) day);
select last_day(curdate() - interval 1 month);

select dayofweek(curdate()) ;
select weekday(curdate());
select date_sub(curdate() , interval weekday(curdate()) day);
select date_sub(curdate() , interval dayofweek(curdate()) -1 day);

select date_add(curdate() , interval weekday(curdate()) day);
select date_add(curdate() , interval dayofweek(curdate()) - 2 day);


select last_day(curdate() - interval 2 week);
select last_day(curdate() - interval 2 week) + interval 1 day) as 1st_day_of_previous_week;

select date_sub(curdate(), interval dayofweek(curdate()) day) + interval 1 week + interval 1 day;

select date_add(curdate(),interval dayofweek(curdate())  day) as 1st_day_of_next_week;

select date_add(date_add(curdate(),interval dayofweek(curdate()) -1 day),interval 1 week);

select date_add(curdate(), interval dayofweek(curdate()) -1 day);