create table guest
(guest_id int primary key,
guest_name varchar(20) not null,
guest_city varchar(20) not null,
guest_state varchar(20) not null);

insert into guest
values(1,"pvb","koppal","kerala"),
(2,"avb","madinood","karnataka"),
(3,"mvb","badami","bihar");