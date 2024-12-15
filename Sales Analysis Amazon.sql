use db_oct;
select * from supermarket_sales;
desc supermarket_sales;

select branch, city from supermarket_sales;
select 'Customer type' from supermarket_sales;

#AND OR NOT operators
select * from supermarket_sales where quantity>7 and payment>'cash';
select * from supermarket_sales where city='yangon' and branch='a';


select * from supermarket_sales where quantity>7 or payment>'cash';
select * from supermarket_sales where city='yangon' or branch='a';
select * from supermarket_sales where city='naypyitaw' or branch='e';

select * from supermarket_sales  where not branch='a';
select * from supermarket_sales  where not quantity=7;
select * from supermarket_sales  where not cogs>100;
select * from supermarket_sales  where not total<500;

#IN and NOT IN operators
select * from supermarket_sales where quantity in (5,7,9);
select * from supermarket_sales where quantity not in (5,7,9);

select * from supermarket_sales where salary in (50000,55000);
select * from supermarket_sales where salary not in (50000,55000);

select * from supermarket_sales where payment in ('ewallet','credit card');
select * from supermarket_sales where payment not in ('ewallet','credit card');
select * from supermarket_sales where 'product line' in ('home and lifestyle','sports and travel');

#BETWEEN and NOT BETWEEN operators
select * from supermarket_sales where quantity between 7 and 9;
select * from supermarket_sales where payment not between 7 and 9;
select * from supermarket_sales where time between '10:30' and '12:00';
select * from supermarket_sales where time not between 10 and 11;
select * from supermarket_sales where 'gross income' between 10 and 15;
select * from supermarket_sales where 'gross income' not between 20 and 40;
select * from supermarket_sales where rating between 5 and 8;
select * from supermarket_sales where rating not between 5 and 8;

#LIKE operators
select * from supermarket_sales where city like 'y%';
select * from supermarket_sales where city not like '_a%';
select * from supermarket_sales where city like '_a%';
select * from supermarket_sales where city like '%n';
select * from supermarket_sales where city like '%o%';
select * from supermarket_sales where city like '_n%';
select * from supermarket_sales where city like 'n%w';

#IS NULL and IS NOT NULL operators
select * from supermarket_sales where branch is null;
select * from supermarket_sales where branch is not null;

#COUNT
select count(*) from supermarket_sales;
select count(1) from supermarket_sales;
select count(branch) from supermarket_sales;
select count(city) from supermarket_sales;
select count(rating) from supermarket_sales;
select count('customer type') from supermarket_sales;
select count('product line') from supermarket_sales;
select count(payment) from supermarket_sales;

#select distict 
select DISTINCT payment from supermarket_sales;
select DISTINCT quantity from supermarket_sales;
select DISTINCT gender from supermarket_sales;
select DISTINCT 'Product line' from supermarket_sales;
select DISTINCT branch from supermarket_sales;

#count of DISTINCT values in a column.
 select count(DISTINCT branch) from supermarket_sales;
select count(DISTINCT payment) from supermarket_sales;
select count(DISTINCT quantity) from supermarket_sales;
select count(DISTINCT time) from supermarket_sales;
select count(DISTINCT city) from supermarket_sales;

#Delete and truncate, drop 
 #1 Delete 
 delete from supermarket_sales where payment='cash';
 set sql_safe_updates=0;
 delete from supermarket_sales where 'invoice id' is null;
 delete from supermarket_sales where time>'12:00';
 delete from supermarket_sales where quantity=7;
 delete from supermarket_sales;
 
 #2 Truncate 
 truncate table supermarket_sales;
 select * from supermarket_sales;
 
 #Drop
 drop table supermarket_sales;
 
#insert table
use db_oct;
select * from supermarket_sales;

 #Alter table
 #1 ADD
 alter table supermarket_sales add column mobileno int;
 
 #2 Modify
 alter table supermarket_sales modify column city varchar(25);
 alter table supermarket_sales modify column branch varchar(25);
 alter table supermarket_sales modify column quantity varchar(25);
 desc supermarket_sales;
 
 #3 drop
 alter table supermarket_sales drop column mobileno;
 
 #4 Rename
 alter table supermarket_sales rename column rating to rate;
  alter table supermarket_sales rename column city to location;

# UPDATE
set sql_safe_updates=0;
update  supermarket_sales set location='pune' where branch='A';
update  supermarket_sales set location='mombai' where branch='B';
select * from supermarket_sales;

#LIMIT clause
select * from supermarket_sales;
select * from supermarket_sales limit 5;
select * from supermarket_sales limit 2;
select * from supermarket_sales limit 2,3;
select * from supermarket_sales limit 50,4;
select * from supermarket_sales limit 100,10;

#Orderby clause
select * from supermarket_sales order by quantity;  #assending order
select * from supermarket_sales order by quantity desc;   #dessending order
select * from supermarket_sales order by total;
select * from supermarket_sales order by total desc;
select * from supermarket_sales order by cogs;
select * from supermarket_sales order by cogs desc;

#Arithematic Expression aggration operatiions(sum, min, max, avg, count)
select total from supermarket_sales;
select sum(total) from supermarket_sales;
select min(total) from supermarket_sales;
select max(total) from supermarket_sales;
select count(total) from supermarket_sales;
select avg(total) from supermarket_sales;

#Alias : it is use to give a dummy name in table or column
select location as loc from supermarket_sales;
select payment as pay, quantity as qt from supermarket_sales;
select 1.5*payment from supermarket_sales;
select 1.5*payment as pay from supermarket_sales;

#create new table from existing table
select * from supermarket_sales limit 4,6;
create table supermarket_sales_new as (select * from supermarket_sales limit 4,6);
select * from supermarket_sales_new;

#SQL Joins
select * from emp_2;
select * from department;

#1. Inner join
select * from emp_2 inner join department on emp_2.did=id;
select empid, fn, ln, sal from emp_2 inner join department on emp_2.did=department.dept_name;
select empid, sal from emp_2 inner join department on emp_2.did=department.id;

#2. left outer join
select * from emp_2 left join department on emp_2.did=id;
select empid, fn, ln, sal from emp_2 left join department on emp_2.did=department.dept_name;
select empid, sal from emp_2 left join department on emp_2.did=department.id;

#3. left outer join
select * from emp_2 right join department on emp_2.did=id;
select empid, fn, ln, sal from emp_2 right join department on emp_2.did=department.dept_name;
select empid, sal from emp_2 right join department on emp_2.did=department.id;

#4 Full outer join
select * from emp_2 left join department on emp_2.did=id
union #full outer join
select * from emp_2 right join department on emp_2.did=id;

select empid, fn, ln, sal from emp_2 left join department on emp_2.did=department.id
union
select empid, fn, ln, sal from emp_2 right join department on emp_2.did=department.id;

#5 CROSS JOIN
select * from emp_2 cross join department;

select count(*) from emp_2 cross join department;

#6 Self join
select * from emp_data;
select * from emp_data e inner join emp_data f on e.empid = f.MGR_ID;
select e.EmpID,e.FName,e.LName ,f.mgr_id, f.DEPT_ID from emp_data e inner join emp_data f on e.empid = f.MGR_ID;

#Costraints
#1 Not Null
create table supermarket_sales_not_null (invoieceid int NOT NULL, branch varchar(10));
select * from supermarket_sales_not_null;
desc supermarket_sales_not_null;

#2 Unique
create table supermarket_sales_uniq(invoieceid int UNIQUE,branch varchar(10));
select * from supermarket_sales_uniq;
desc supermarket_sales_uniq;

#3 check 
create table emp_chk(empid int,fname varchar(10), CHECK(empid<1010));

insert into emp_chk values(1001,'Rakesh');
select * from emp_chk;

#4 primary key: duplicate and null values are not allowed
create table supermarket_sales_pri(invoieceid int PRIMARY KEY,branch varchar(10));
select * from supermarket_sales_pri;
desc supermarket_sales_pri;

# 5 Defult Constraint: 
create table supermarket_sales_def (invoieceid int DEFAULT 1005,branch varchar(10));
select * from supermarket_sales_def;
desc supermarket_sales_def;

#7 Auto Incriment
create table supermarket_sales_AI (invoieceid int AUTO_INCREMENT PRIMARY KEY,
					 branch varchar(10));
select * from supermarket_sales_AI;

#8 Foreign key: 
create table department (id int PRIMARY KEY,  # parent/referenced table
                      name varchar(10));
                      
#Union and Union All:
select * from supermarket_sales;

select * from supermarket_sales LIMIT 5; 
create table supermarket_sales_first5 as (select * from supermarket_sales LIMIT 5);
select * from supermarket_sales_first5; 

select * from supermarket_sales LIMIT 4,5;  
create table supermarket_sales_next5 as (select * from supermarket_sales LIMIT 4,5);
select * from supermarket_sales_next5; 

# 1. UNION
select * from supermarket_sales_first5 
UNION
select * from supermarket_sales_next5; 

# 2. UNION ALL
select * from supermarket_sales_first5 
UNION ALL
select * from supermarket_sales_next5; 

#SQL views
#craete a inner join view
create view inner_join as
select * from emp_2 inner join department on emp_2.did=department.id;
select * from inner_join;

alter view inner_join as 
select empid from emp_2 inner join department on emp_2.did=department.id;

#SQL INDEX : 
select * from supermarket_sales where total>200;
create index supermarket_sales_quantity
on supermarket_sales(quantity);
desc supermarket_sales;

# Case statement
# eg.1 using case statement with select
select * from supermarket_sales;

select branch,total,                                                   
case                                                                          
   when total>20000 then 'super'                          
   when total=2000 then 'mid_exp'                          
   else 'bad'                                                           
   end as profile                                                            
   from supermarket_sales; 
   
   # eg.2 using case statement to update multiple rows
select * from supermarket_sales;

alter table supermarket_sales
add column age int;

update supermarket_sales set age = 
case 
when branch = 'A' then 20
when branch = 'B' then 30
when branch = 'C' then 25
else 35
end; 

# String functions
#  1.Substring/substr/mid function

select substr('machine',2,5); 
Select substr('python',2,2); 
Select substr('python',2);  

select * from supermarket_sales;
select location from supermarket_sales;
SELECT SUBSTR('location', 2, 4);
select substr('location',1,4);

#2.REPLACE Function 
Select replace('sql tutorial','sql','DS'); 
select replace('python','python','JAVA');
select location from supermarket_sales;
Select location,replace(location,'a','@') from supermarket_sales;
Update supermarket_sales set location=replace(location,'a','$');
Update supermarket_sales set location=replace(location,'$','a');

#3.INSTR Function
select instr('sushil','s');
select instr('sushil','p');
select instr('Sushil','s');

select location from supermarket_sales;
SELECT location,INSTR(location, "n") FROM supermarket_sales;
SELECT location,INSTR(location, "a") FROM supermarket_sales;

#4.Upper/Ucase
select UPPER("SQL Tutorial is FUN!");
select UCASE("SQL Tutorial is FUN!");
select location,upper(location) from supermarket_sales;
select location,upper(location) as upper_location from supermarket_sales;

#5.Lower/Lcase 
select lower("SQL Tutorial is FUN!");
select * from supermarket_sales;
select location,lower(location) from supermarket_sales;
select location,lower(location) as lower_loc from supermarket_sales;

#6.Char_length/Character_length/length
select location,char_length(location) from supermarket_sales;

#7.LEFT,RIGHT
select left("SQL Tutorial", 3);
select location from supermarket_sales;
select location,left(location,3) as loc_3 from supermarket_sales;

select right("SQL Tutorial", 3);
select location,right(location,3) from supermarket_sales;

#8.Concat
select * from supermarket_sales;
select branch,location,concat(branch,location) from supermarket_sales;
select branch,location,concat(branch,' ',location) from supermarket_sales;

#9.Insert-
select insert("sqltutorial.com", 1, 9, "Example");
select insert("sqltutorial.com", 11, 3, "no");
select insert("sqltutorial.com", 11, 0, "no ");

#10.Locate/Position 
select location,locate('a',location) from supermarket_sales;
select location,locate('a',location,7) from supermarket_sales;

# 11. Mod 
select mod(10,4);
select mod(10,3); 
select mod(10,2); 
select * from supermarket_sales;
select * from supermarket_sales where mod(total,2)!=0;  
select * from supermarket_sales where mod(total,2)=0;   

# Date Functions

#1.DATE() 
select * from supermarket_sales;
SELECT DATE(joindate) FROM supermarket_sales;

#2.DATE_FORMAT()
SELECT DATE_FORMAT("2017-06-15", "%Y");
SELECT DATE_FORMAT("2017-06-15", "%y");
SELECT DATE_FORMAT("2017-06-15", "%M %d %Y");
SELECT DATE_FORMAT("2017-06-15", "%m");
SELECT DATE_FORMAT("2024-10-30", "%W");
SELECT DATE_FORMAT("2024-10-30", "%w");
SELECT DATE_FORMAT("2024-10-30", "%W %M % %Y");
SELECT DATE_FORMAT("sql", "%W %m %e %y");

select * from supermarket_sales;
SELECT joindate,DATE_FORMAT(joindate, "%W %M %e %Y") FROM supermarket_sales;

# 3. ADDDATE/DATE_ADD
SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY); # Add 10 days to a date
SELECT ADDDATE("2017-06-15 09:34:21", INTERVAL 15 MINUTE); # Add 15 minutes to the time
SELECT ADDDATE("2017-06-15 09:34:21", INTERVAL -3 HOUR);   # Subtract 3 hours
SELECT ADDDATE("2017-06-15", INTERVAL -2 MONTH); # subtract 2 months

# 4.DATE_SUB / SUBDATE
SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);
SELECT DATE_SUB("2017-06-15 09:34:21", INTERVAL 15 MINUTE);
SELECT DATE_SUB("2017-06-15 09:34:21", INTERVAL 3 HOUR);
SELECT DATE_SUB("2017-06-15", INTERVAL -2 MONTH);

# 5.ADDTIME
SELECT ADDTIME("2017-06-15 09:34:21", "2");    # Add 2 seconds to a time
SELECT ADDTIME("2017-06-15 09:34:21", "2:2");
SELECT ADDTIME("2017-06-15 09:34:21", "2:2:2");

# 6.CURDATE/ CURRENT_DATE
SELECT CURDATE();
SELECT CURRENT_DATE();

# 7.CURRENT_TIME/CURTIME
SELECT CURRENT_TIME();
SELECT CURTIME();

# 8.CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP();

# 9.DATEDIFF
SELECT DATEDIFF("2017-08-25", "2017-06-15");

# 10.DAYNAME
SELECT DAYNAME("2024-08-15");    
SELECT DAYNAME("2024-08-18 09:34:21");
SELECT DAYNAME(CURDATE());

# 11.DAYOFWEEK
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK("2024-08-15");    # Weekday number
SELECT DAYOFWEEK("2024-11-01");     

# 12.DAYOFYEAR
SELECT DAYOFYEAR("2024-08-18");
SELECT DAYOFYEAR("2024-12-31");
SELECT DAYOFYEAR(CURDATE());

# 13.YEAR, MONTH, DAY, HOUR,MINUTE,SECOND
SELECT YEAR("2017-06-15 09:34:21");
SELECT MONTH("2017-06-15 09:34:21");
SELECT DAY("2017-06-15 09:34:21");  # Day of month
SELECT HOUR("2017-06-15 09:34:21");
SELECT MINUTE("2017-06-15 09:34:21");
SELECT SECOND("2017-06-15 09:34:21");

SELECT DAY(CURDATE());
SELECT DAYOFMONTH("2024-10-30");

select * from supermarket_sales;
SELECT joindate,YEAR(joindate) FROM supermarket_sales;
SELECT joindate,MONTH(joindate) FROM supermarket_sales;
SELECT joindate,DAY(joindate) FROM supermarket_sales;

#Subqueries
select * from supermarket_sales;

# 1. Using a Subquery in a WHERE Clause
select total from supermarket_sales where total>200;

select branch,location,quantity 
from supermarket_sales 
where total in (select total from supermarket_sales where total>200);

# 2. Using a Subquery in a FROM Clause
select * from supermarket_sales;
select * from supermarket_sales where total>20;

select quantity,branch from 
(select * from supermarket_sales where total>200) as subquery1;

select total,branch,payment from 
(select * from supermarket_sales where payment='cash') as subquery2;

# 3.Using a Subquery in a SELECT Clause
select * from supermarket_sales;
SELECT total FROM supermarket_sales WHERE quantity=7;
SELECT branch,location from supermarket_sales;
SELECT branch,location,(SELECT total FROM supermarket_sales WHERE quantity=7) AS tall
FROM supermarket_sales;

#Masking
select replace('123456789','456789','******');
select substr('123456789',4);
select replace('123456789',substr('123456789',4),'******');

