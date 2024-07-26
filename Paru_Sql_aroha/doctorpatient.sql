use aroha;
create table doctor
(Doc_id varchar(20) primary key,
Fname varchar(20) not null,
Lname varchar(20) not null,
city varchar(20) not null,
speciality varchar(20) not null,
Phone double );
insert into doctor values("ABC100001","Tim",	"Seeley",	"Bangalore",	"Ortho",	1234568976),
("ABC100002",	"Mark","	Williams",	"Chennai	","Pediatrician",	2345673546),
("ABC100003","	Barbie"	,"Smith",	"Bangalore",	"Dental",	3459877676),
("ABC100004",	"Mathew",	"Brown",	"Chennai",	"Ortho",9087676576),	
("ABC100005"	,"Carol",	"Brown",	"Delhi",	"OBGyn",	7653459872);
drop table doctor;
drop table patient;
select * from doctor;


create table patient
(pat_id varchar(20) primary key,
Fname varchar(20) not null,
Lname varchar(20) not null,
dob date not null,
insurance_company varchar(20) not null,
Phone double);
drop table patient;
insert into patient values("PAT100001",	"Kim",	"Smith",	"1988/01/11",	"BCBS12345A",	8907658766),
("PAT100002","	Michael",	"Jackson",	"1980/04/23",	"AETNA23456C",	2659875645),
("PAT100003","	Rachel","	Walker","	1979/11/12","	UHC653462B",	2016549856),
("PAT100004","	Donald",	"Taylor","2000/04/18","	AETNA23567S",	"7188764567"),
("PAT100005","	Priya"	,"Bhatt","	1999/01/25",	"BCBS87654R",	7327895643),
("PAT100006","	Sam","	Odokoya",	"2012/04/14",	"UHC786543Y",	6096573256),
("PAT100007",	"Jack",	"Dolan",	"2000/04/15"	,"ANTH78693U",	9086477482);

select * from patient;
drop table cases;
create table cases
(cases_id int primary key,
pat_id varchar(20), foreign key(pat_id) references patient(pat_id),
doc_id varchar(20), foreign key(doc_id) references doctor(doc_id),
admission_date date not null,
diagnosis varchar(20) not null);
select * from doctor;
select *  from patient;
select * from cases;
insert into cases values(1,	"PAT100003",	"ABC100003",	"2019/2/09","Tooth ache"),
(2,"	PAT100002","	ABC100001","	2019/12/31","	Broken hand"),
(3,"PAT100006",	"ABC100004","	2019/2/31",	"Broken Tooth"),
(4,"PAT100001",	"ABC100003",	"2020/07/04","	Chest pain"),
(5,"PAT100003",	"ABC100005","	2020/07/07","	Ultrasound"),
(6,"	PAT100006",	"ABC100002","	2020/09/04",	"Stomach bug"),
(7,"	PAT100002","	ABC100004",	"2020/09/05",	"Tooth ache"),
(8,	"PAT100004","ABC100003","	2020/11/07","	Chest pain"),
(9,"	PAT100007",	"ABC100001","	2020/11/10","	Injury in Right Knee"),
(10,"	PAT100005","	ABC100005",	"2020/11/14",	"Delivery"),
(11,"	PAT100001","	ABC100004",	"2020/11/15","	Ultrasound");
drop table cases;

#Citywise Number of Doctors		
select count(doc_id) as numberofdoctors,city 
from Doctor group by city;  

#Find Doctors who are from the same city of Doctor Mathew				
select Fname 
from doctor 
where city =(select city from doctor where Fname ='Mathew');

#Find all the Patients whose name starts with a letter P			
select Fname,Lname
from patient 
where Fname like 'P%';   

#Display PatientName and Age of the patient			
select Fname,age
from patient
 where age=year(curdate)-year(dob);

#1.	Find all the patients who are treated in the first week of this month.
select * from patient;
select * from cases;
select pat_name
from patient p,case 
2.	Find all the doctors who have more than 3 admissions today
3.	Find the patient name (first,last) who got admitted today where the doctor is ‘TIM’
4.	Find the Doctors whose phone numbers were not update (phone number is null)
5.	Display the doctors whose specialty is same as Doctor ‘TIM’
6.	Find out the number of cases monthly wise for the current year
7.	Display the doctors who don’t have any cases registered this week
8.	Display Doctor Name, Patient Name, Diagnosis for all the admissions which happened on 1st of Jan this year
9.	Display Doctor Name, patient count based on the cases registered in the hospital.
10.	Display the Patient_name, phone, insurance company, insurance code (first 3 characters of insurance company)
11.	Create a view which gives the doctors whose specialty is ‘ORTHO’ and call it as ortho_doctors

 select dayofweek("2021/2/3");
