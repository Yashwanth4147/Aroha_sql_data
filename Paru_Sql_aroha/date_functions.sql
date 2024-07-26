select date_sub(curdate(), interval dayofyear(curdate()) -1 day) as first_day_of_current_year;

select date_add(date_sub(curdate(), interval dayofyear(curdate()) day), interval 1 year) as last_day_of_current_year;

select makedate(year(curdate() - interval 1 year),1) as 1st_day_of_previous_year;

select date_sub(curdate(), interval dayofyear(curdate()) day) as last_day_of_previous_year;

select date_add(date_sub(curdate(), interval dayofyear(curdate()) -1 day), interval 1 year) as 1st_day_of_next_year;

select date_add(date_sub(curdate(),interval dayofyear(curdate()) day), interval 2 year) as last_day_of_next_year;

select date_sub(curdate(), interval dayofmonth(curdate()) -1 day) as 1st_day_of_current_month;

select last_day(curdate());

select date_sub(curdate(), interval dayofmonth(curdate()) day) as 1st_day_of_previous_month;

select last_day(curdate() - interval 1 month) as last_day_of_previous_month;

select date_add(date_sub(curdate(),interval dayofmonth(curdate()) -1 day), interval 1 month) as 1st_day_of_next_month;

select last_day(curdate() + interval 1 month) as last_day_of_next_month;

select date_sub(curdate(), interval dayofweek(curdate()) -1 day) as 1st_day_of_current_week;

select date_add(curdate(),interval dayofweek(curdate()) -1 day) as last_day_of_current_week;

select last_day(curdate() - interval 2 week) + interval 1 day as 1st_day_of_previous_week;

select date_sub(curdate(), interval dayofweek(curdate()) day) as last_day_of_previous_week;

select date_add(curdate(),interval dayofweek(curdate())  day) as 1st_day_of_next_week;

select date_add(date_add(curdate(),interval dayofweek(curdate()) -1 day),interval 1 week) as last_day_of_next_week;

#1st_day_of_current_quarter
select makedate(year(curdate()),1) + interval quarter(curdate()) quarter
- interval 1 quarter;

#last_day_of_current_quarter
select makedate(year(curdate()),1) + interval quarter(curdate()) quarter
- interval 1 day;

#1st_day_of_next_quarter
select makedate(year(curdate()),1) + interval quarter(curdate()) quarter;

#last_day_of_next_quarter
select makedate(year(curdate()),1) + interval quarter(curdate()) quarter
+ interval 1 quarter - interval 1 day;

#1st_day_of_previous_quarter
select makedate(year(curdate()),1) - interval quarter(curdate()) quarter;

#last_day_of_previous_quarter
select makedate(year(curdate()),1) - interval quarter(curdate()) quarter
+ interval 1 quarter - interval 1 day;