use aroha;
CREATE TABLE PRODUCTP
( P_ID INT,
 P_NAME VARCHAR(20), 
 P_FAMILY VARCHAR(20),
 PRICE INT,
 COST INT ,
 LAUNCHED_DATE DATE );
INSERT INTO PRODUCTP VALUES
(100,'MAKER','STATIONARY',25,22,'2008/1/15') ,
(101,'MOUSE','COMPUTER',450,350,'2009/4/16'), 
(102,'WHITE_BOARD','STATIONARY',450,375,'2010/8/20'), 
(103,'SONY VAIO','COMPUTER',35000,42000,'2010/9/21') ;

UPDATE PRODUCTP
SET LAUNCHED_DATE="2020/7/3"
WHERE  P_ID=103;

UPDATE PRODUCTP
SET LAUNCHED_DATE="2019/5/24"
WHERE  P_ID=102;

UPDATE PRODUCTP
SET LAUNCHED_DATE="2021/8/12"
WHERE P_ID=102;
SELECT * FROM PRODUCTP;

#1.	Write the select statement which gives all the products which costs more than Rs 250.
		SELECT P_NAME 
        FROM PRODUCTP 
        WHERE PRICE>250;

#2.	Write the select statement which gives product name, cost, price and profit. (profit formula is price – cost)
SELECT P_NAME,COST,PRICE ,PRICE-COST AS PROFIT
 FROM PRODUCTP;
 
# 3.	Find the products which give more profit than product Mouse
SELECT P_NAME
 FROM PRODUCTP WHERE
PRICE-COST>(SELECT PRICE-COST FROM PRODUCTP WHERE P_NAME LIKE "MOUSE"); 


#4.	Display the products which give the profit greater than 100 Rs.
SELECT P_NAME,PRICE-COST AS PROFIT
FROM PRODUCTP
WHERE PRICE-COST>100;

#5.	Display the products which are not from Stationary and Computer family.
SELECT P_NAME
FROM PRODUCTP
WHERE P_FAMILY NOT IN ("STATIONARY","COMPUTER");


#6.	Display the products which give more profit than the p_id 102.
SELECT P_NAME
FROM PRODUCTP
WHERE PRICE-COST>(SELECT PRICE-COST FROM PRODUCTP WHERE P_ID=102);

#7.	Display products which are launched in the year of 2010.
SELECT P_NAME
FROM PRODUCTP
WHERE YEAR(LAUNCHED_DATE)=2010;

#8.	Display the products which name starts with either ‘S’ or ‘W’ and which belongs to Stationary and cost more than 300 Rs
SELECT P_NAME,P_FAMILY
FROM PRODUCTP
WHERE P_NAME LIKE "S%" OR P_NAME LIKE "W%"
AND P_FAMILY="STATIONARY"
AND COST>300;

#9.	Display the products which are launching next month.
#SELECT  P_NAME,
#FROM PRODUCTP
#WHERE  MONTH(LAUNCHED_DATE)=MONTH(CURDATE() +  INTERVAL 1 MONTH);

SELECT P_NAME
FROM PRODUCTP
WHERE MONTH(LAUNCHED_DATE)=MONTH(LAST_DAY(CURDATE())+INTERVAL 1 DAY);
#10.	Display product name which has the maximum price in the entire product table.
SELECT P_NAME
FROM PRODUCTP
WHERE PRICE=(SELECT MAX(PRICE) FROM PRODUCTP);

#11.	List the product name, cost, price, profit and percentage of profit we get in each product.
SELECT P_NAME,COST,PRICE,PRICE-COST/100 AS PERCENTAGE_OF_PROFIT
FROM PRODUCTP;


#12.	Display how many products we have in Computer family which has the price range between 2000 and 50000.
SELECT P_NAME,COUNT(P_ID)
FROM PRODUCTP
WHERE P_FAMILY="COMPUTER"
AND PRICE BETWEEN 2000 AND 50000
GROUP BY P_NAME;

####SELECT P_NAME
	FROM PRODUCTP
	WHERE P_ID IN (SELECT COUNT(P_ID) FROM PRODUCTP WHERE P_FAMILY="COMPUTER");


SELECT  DISTINCT( P_FAMILY)
FROM PRODUCTP;


select p_name
from productp
where year(curdate())-year(launched_date)
and year(curdate())-year(launched_date);
select dayofweek(curdate());

Select p_name
from productp
where price=(select min(price) from productp);
select * from productp;

select p_name,p_family,max(price)
from productp
where price in(select max(price) from productp)
Group by p_family;


select p_name
from productp
where month(launched_date)=month(curdate()+interval 1 month);

select p_name,price-cost as profit
from productp
where price-cost>5000;

select p_name,price-cost as profit from productp where price-cost>3;
select month(launched_date) from productp;