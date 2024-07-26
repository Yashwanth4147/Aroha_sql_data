
--update using -case statement
select * from patient;
desc patient;
/
update patient set loc_id=case when ins_comp='y' then 1
                  else 0 end;
--display duplicate record
update patient set fname='ajay'
where pat_id='p4';
/
select fname
from patient
group by fname
having count(fname)>1;
/
select fname
from patient
where rowid not in(select max(rowid)
                    from patient
                    group by fname);
--delete duplicate records
delete
from emp
where rowid not in(select max(rowid)
                    from emp
                    group by ename);
                    update emp set ename='SMITH'
                    where empno=7499;
                    /
delete
from emp e
where rowid not in(select max(rowid)
             from emp b
             where b.ename=e.ename);
             
--display 10th record
 select * from patient;
    select fname||lname
    from patient
    where rownum<=6
    minus
      select fname||lname
    from patient
    where rownum<=5;
    
--delete 10th record
 select * from patient;
  delete from patient 
  where fname||lname= (select fname||lname
    from patient
    where rownum<=6
    minus
      select fname||lname
    from patient
    where rownum<=5);
--display -common records using inner join ,intersect,exists
select * from bbb;
create table aaa as select * from bbb;

select * from aaa;
select * from bbb;

insert into aaa values(1);

select * from common1;
select * from common2;
desc common1;
/--using innerjoin
select a.comm_name
from common1 a,common2 b
where a.comm_name=b.c_name;
/--using intersect
select comm_name
from common1
intersect
select c_name
from common2
/--using co-related
select comm_name
from common1 a
where exists (select c_name
             from common2 b
             where a.comm_name=b.c_name);
             
--update column 5th column
        select * from emp;
             
            select column_name
             from user_tab_columns
             where table_name='EMP' and rownum<=6
             minus
              select column_name
             from user_tab_columns
             where table_name='EMP' and rownum<=5 ;
             
    alter table emp rename column mal to mgr;
    
    --delete a column
    alter table emp drop column city11;
    --add column 
    alter table emp add  city varchar2(20);
    --modify the range on column
     desc emp;
     alter table emp modify city varchar2(40);
     --add constraint 
     select * from patient;
     alter table patient add CONSTRAINT not_nul_phone  UNIQUE(PHONE);
     
desc patient;

--merge command
select * from city;
create table city_copy as select * from city;
select * from city_copy;
truncate table city_copy;
/
merge into city_copy tgt using (select city_id,city_name,city_pop,pin from city) ss
on (tgt.city_id=ss.city_id)

when not matched then
insert(city_id,city_name,city_pop,pin)values(ss.city_id,ss.city_name,ss.city_pop,ss.pin)
when matched then 
update set tgt.city_pop=ss.city_pop
where tgt.city_id=ss.city_pop;
/
--display recent record
 select * from emp;
 
 select ename
 from emp
 where rowid in(select max(rowid)
                 from emp)
                 
--pivot/
/
 select * from patient;

select * from (select deptno,empno from emp)
pivot(count(empno) for deptno in (10,20,30,40));

select * from (select pat_id,fname,ins_comp from patient)
pivot(count(fname) for ins_comp in ('y'));

    
             /
              select deptno,listagg(ename,',')within group (order by sal desc) as dept_ename
      from emp
      group by deptno
      /
      
declare 
  x number:=5;
  
  begin
   for i in 1..x-1 loop
   x:=x*i;
   end loop;
   dbms_output.put_line(x);
end;
/
  select to_char(add_months(trunc(sysdate,'yy'),+level),'month')
from dual
connect by level<=12;

select sysdate+level-1
from dual
connect by level<=12
/

create index mahess on product(upper(p_name));

select to_date(10,'mm')+level-1
from dual
connect by level<=31;
select * from treat_type;

/
select 
select 82369*45321 from dual;

/

select   add_months(trunc(sysdate,'mm')+level-1,2)
from dual
connect by level <=31;

/
select to_date(10-1,'mm')+level-1
from dual
connect by level<=30;
/
select * from dept;
/
/
select deptno,listagg(ename,',') within group (order by deptno) as emp_name
from emp
group by deptno;
/
select dname,listagg(ename,',')within group (order by dname) as emp_name
from dept d,emp e
where d.deptno=e.deptno
group by dname;0

/
--how you will update 
--add column by name pin2 to city
select * from city;

alter table city add pin2 varchar2(20);
--update a column pin2 to pin3 and data type range of 20-30

alter table city rename column pin2 to pin3;
--update the pin3 range from 30-30

alter table city modify pin3 varchar2(30);
desc city;

--drop column pin3
alter table city drop column pin3;

--update 5th column in emp

select column_name from user_tab_columns
where table_name='EMP' and rownum <=5
minus
select column_name from user_tab_columns
where table_name='EMP' and rownum <=4;

/




select * from emp;
rollback;
/

    delete
    from emp
    where rowid not in(select max(rowid)
                        from emp
                        group by ename);
                        /
     rollback;
     /
   create table  emp  as select * from deapr2022_monisha.emp1;
   /
   select * from emp;
     /
     delete  
     from emp
     where job is null;
     /
     update emp set ename='MILLER'
     where empno=7902;
     
     
     /
    delete
    from emp a
    where rowid <> (select min(rowid)
                        from emp b
                        where a.ename=b.ename )
                    
                    
DELETE t1 FROM contacts t1  
INNERJOIN contacts t2   
WHERE  
    t1.id < t2.id AND  
    t1.email = t2.email;  

/
 delete
    from emp 
    where tab_id not in (select max(tab_id) or min(tab_id)
                        from emp 
                        group by emp,ename );
/
select * from emp;
/
 delete ename from emp e,emp b
 where e.ename=b.ename and e.empno > b.empno;


/
--write a procedure which accept user input as date and give count of friday and 
--display the friday ,but only 1 friday for each month--

/
create or replace procedure sp_count_friday(v_year varchar2)as
x date;
start_dt date;
end_dt date;
no_of_days number(20);
v_count number(4):=0;
k varchar2(30);

begin
     x:=to_date(v_year,'yy');
     start_dt:=trunc(x,'yy');
     end_dt:=add_months(start_dt,12)-1;
     
     no_of_days:=end_dt-start_dt;
     
            for i in 1..no_of_days loop
          
            if to_char(start_dt,'dy')in ('fri') and to_char(start_dt,'w')=4 then
               k := to_char(start_dt,'day');
            dbms_output.put_line(start_dt||'=is '||k);
             v_count:=v_count+1;
            end if;
            --v_count:=v_count+1;

            start_dt:=start_dt+1;
            end loop;
             dbms_output.put_line(v_count);
            end;
            /
            exec SP_COUNT_FRIDAY('22');
            /
            set serveroutput on;
/
--Create a procedure which takes month as an argument and return all the different treatments, no of
--different doctors who gave the treatment and the no of different patients who got the treatment
create or replace procedure sp_treat(v_mm number) as

cursor c is select distinct treat_name as trt_name,count(distinct doc_id) as count_doc,count(distinct pat_id) as count_patient
from treatment t,pat_treatment p
where t.treat_id=p.treat_id and to_char(p.treat_date,'mm')=v_mm
group by treat_name;
begin
for i in c  loop
dbms_output.put_line(i.trt_name||','||i.count_doc||','||i.count_patient);
end loop;
end;
/

exec sp_treat(7);
/
select to_char(sysdate,'dy-mm-yy') ='23-12-22' from dual;

/
select to_char(to_date('20-jun-2022'),'day') from dual
/
     /
 select date '2011-4-12' - date '2011-4-10' from dual;
 /
     
select abs(date '2011-4-12' - date '2022-2-06') from dual;
/

select date'2011-4-12'-date'2022-03-06' from dual;
/
--delete 10th record
/
delete rowid from(select rowid
from emp
where rownum <=10
minus
select rowid
from emp
where rownum <=9)A;

     
delete from emp where rowid='AAAW3xAAAAABDzDAAL';

select * from emp;

rollback;
--display n th salary

select * from (select ename,sal ,dense_rank() over(order by sal desc)rnk
                 from emp)A
                 where A.rnk=&n;

update emp set sal=-(sal) where deptno=30;

--recent record

select * from emp;
/
select ename
from emp 
where rowid in(select max(rowid)
              from emp);
/
select to_char(to_date('13-08-2800'),'day') from dual;

/
select to_date('13-08-220','dd-mm-yyyy') from dual;
/
select instr('mahi','m') from dual;

select ename,sal,lag(sal,1,0) over(order by deptno desc) as previous_val
from emp;
select ename,sal,lead(sal,1,0) over(order by sal desc) as next_val
from emp;
/
 create or replace function fun_yr(p_from_year date,p_to_year date)return number as
  v_amount number(38);
  
  begin
    select sum(amount) into v_amount
    from customer_retail c,sales_retail b
    where c.cust_id=b.cust_id and to_char(sales_date,'yy') between to_char(p_from_year,'yy') and to_char(p_to_year,'yy')
    group by cust_city;
    return v_amount;
  end;
  /
  
  select fun_yr('10-10-18','10-10-22') from dual;
  /

/
 create or replace function fun_yr(p_from_year date)return number as
  v_amount number(38);
  
  begin
    select sum(b.amount) into v_amount
    from customer_retail c,sales_retail b
    where c.cust_id=b.cust_id and to_char(sales_date,'yy') >= to_char(p_from_year,'yy') 
    group by cust_city;
    return v_amount;
  end;
  /
  
  select fun_yr('10-10-18') from dual;
  /
