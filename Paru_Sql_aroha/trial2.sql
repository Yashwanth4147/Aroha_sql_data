create table customer
(cust_id int primary key,
cust_name varchar(10) not null,
cust_phone varchar(10),
cust_dob date not null);
insert into customer values
(1,"pvb",5679345267,"2012-4-3"),
(2,"svb",4536728907,"1989-8-25"),
(3,"mvb",435627875,"1991-10-8"),
(4,"avb","","1889-11-17"),
(5,"vdb",7684647383,"2019-1-29");

create table sales
(sales_id int primary key,
sales_name varchar(10),
sales_date date not null
cust_id int foreign key(cust_id ) reference customer(cust_id)
prod_id int foreign key(prod_id) reference product(prodt_id);

insert into sales values
(