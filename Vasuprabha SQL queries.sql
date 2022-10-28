CREATE TABLE VASU_EMPLOYEES 
( 
ID INT PRIMARY KEY, 
FIRST_NAME VARCHAR(40), 
LAST_NAME VARCHAR(40), 
SALARY DECIMAL(8,2), 
DEPARTMENT_ID INT, 
YEAR_OF_JOINING DATETIME, 
YEAR_OF_RELIEVING DATETIME 
) 
 
CREATE TABLE  VASU_DEPARTMENTS 
( 
DEPARTMENT_ID INT PRIMARY KEY, 
MANAGER_ID INT, 
DEPARTMENT_NAME VARCHAR(50) 
) 
 select * from VASU_EMPLOYEES
 select * from VASU_DEPARTMENTS 

 insert into VASU_EMPLOYEES (
 ID , FIRST_NAME , LAST_NAME , SALARY , DEPARTMENT_ID , YEAR_OF_JOINING , YEAR_OF_RELIEVING
 ) 
 values 
 (11,'Vasu','Prabha',1500,10,2020,2024),
 (12,'Subha','Arjun',10000,20,2020,2025),
 (13,'Anbu','Das',3000,40,2020,2026),
 (14,'Srikanth','Reddy',15000,50,2020,2028),
  (15,'Kavi','Jonson',12000,60,2020,2025),
 (16,'Vijay','Jonson',12000,80,2020,2024),
  (17,'Karthick','Bala',12000,90,2020,2026);
  
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2003-10-21 ' where ID=11
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2004-10-21 ' where ID=12
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2004-10-1 ' where ID=13
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2004-10-21 ' where ID=14
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2004-10-12 ' where ID=15
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2004-10-21 ' where ID=16
  update VASU_EMPLOYEES set YEAR_OF_JOINING='2004-May-11 ' where ID=17
  update VASU_EMPLOYEES set DEPARTMENT_ID=90 where ID=12
  update VASU_EMPLOYEES set SALARY=6000 where ID=12
  update VASU_DEPARTMENTS set DEPARTMENT_ID=22 where MANAGER_ID =222
  

 insert into VASU_DEPARTMENTS ( 
DEPARTMENT_ID , 
MANAGER_ID , 
DEPARTMENT_NAME 
) 
values
(10,222,'HR'),
(20,232,'Support'),
(40,252,'Accounts'),
(50,220,'Sales'),
(60,100,'Finance'),
(80,null,'Admin'),
(90,null,'Technical');

--1.Write a query to display all the name which starts with S 
select FIRST_NAME , LAST_NAME 
from VASU_EMPLOYEES
where FIRST_NAME like 'S%'

--2.Write a query to display all the name starts with S and ends with character n. 
select FIRST_NAME , LAST_NAME 
from VASU_EMPLOYEES
where FIRST_NAME like 'S%'and LAST_NAME like '%n'

--3.Write a query to display all the employees who are all working for department 90 and their name must starts with ‘S’. 
select*
from VASU_EMPLOYEES
where FIRST_NAME like 'S%' and DEPARTMENT_ID=90

--4.Display all the department id which contain 2 as 2nd character. 
select DEPARTMENT_ID
from VASU_DEPARTMENTS
where DEPARTMENT_ID like '_2%'

--5.Write a query to display all the employees who are all working in department 10,20,50 and 90.
select * from VASU_EMPLOYEES
where DEPARTMENT_ID in (10,20,50,90)

--6.Write a query to display who are all getting salary between 5000 and 7000.
select FIRST_NAME , LAST_NAME ,SALARY
from VASU_EMPLOYEES
where SALARY between 5000 and 7000

--7.Display First_name, salary, department_id and manager_id of the employee who don't have manager 
select VASU_EMPLOYEES.FIRST_NAME ,VASU_EMPLOYEES.SALARY , VASU_DEPARTMENTS.DEPARTMENT_ID , VASU_DEPARTMENTS.MANAGER_ID
from VASU_EMPLOYEES  inner join VASU_DEPARTMENTS  on VASU_EMPLOYEES.DEPARTMENT_ID= VASU_DEPARTMENTS.DEPARTMENT_ID
Where  VASU_DEPARTMENTS.MANAGER_ID is null

--8.Display all the records in employees table and sort the first name in ascending order. 
select * from VASU_EMPLOYEES
order by  FIRST_NAME asc

--9.Display first name, department id and salary from employees table and sort the records ( sort department id in ascending order and salary in descending order)  
select FIRST_NAME ,SALARY , DEPARTMENT_ID
from VASU_EMPLOYEES ORDER BY DEPARTMENT_ID ASC ,SALARY DESC

--10.Display first three characters from first name. 
select substring (FIRST_NAME , 1,3) from VASU_EMPLOYEES

--11.Display last two character from last name. 
select right (LAST_NAME , 2) as ExtractString from VASU_EMPLOYEES

--12.Display all the first name and position of a in that name (first occurrence of a).  
select CHARINDEX ('a' ,FIRST_NAME ) AS MatchPosition from VASU_EMPLOYEES

--13. Write a query to select maximum salary from employees table.
select max(SALARY) as 'MAXIMUM SALARY'
from VASU_EMPLOYEES

--14.Write a query to select second maximum salary from employees table
select max(SALARY) as 'SECOND MAXIMUM SALARY' from VASU_EMPLOYEES where SALARY < (select max(SALARY) from VASU_EMPLOYEES);

--15.Display average salary in the department 90 
select avg(SALARY) as 'AVERAGE SALARY' from VASU_EMPLOYEES
where DEPARTMENT_ID=90

--16.Display number of employees joined in each year into department 30. 
 select count(DEPARTMENT_ID) from VASU_EMPLOYEES where DEPARTMENT_ID=30

--17.Display average salary for employees who did a job in the past. 
select avg(SALARY) as 'AVERAGE SALARY' from VASU_EMPLOYEES
where YEAR_OF_JOINING < 2022 

--18.Display the month in which more than 5 employees joined in any department 
 select month (YEAR_OF_JOINING) as MONTH_OF_JOINING
 from VASU_EMPLOYEES
 group by month (YEAR_OF_JOINING) 
 having count(ID)>5

--19.Display employee last name, starting date for all jobs from 2000 to 2005. 
select LAST_NAME ,YEAR_OF_JOINING from VASU_EMPLOYEES
where year (YEAR_OF_JOINING) between 2000 and 2005

--20.Display years in which more than 10 employees joined. 
select count(YEAR_OF_JOINING) 
from VASU_EMPLOYEES
where (year(YEAR_OF_JOINING))>=10

--21.Display employee ID for jobs with average salary more than 10000.  
select ID , avg(SALARY) as 'AVG.SALARY'
from VASU_EMPLOYEES
group by ID 
having count(ID)>10

--22.Display the number of days between working for all employees. 
 select datediff (day,YEAR_OF_JOINING,YEAR_OF_RELIEVING) as WORKING_DAYS_DIFFERENCE,FIRST_NAME from VASU_EMPLOYEES


--23.Display employees who joined in the current year.  
select ID,FIRST_NAME
from VASU_EMPLOYEES
where (year(YEAR_OF_JOINING))=2022

--24.Display first name in upper case and last name in lower case. 
select upper (FIRST_NAME) ,lower(LAST_NAME)
from VASU_EMPLOYEES

--25.Display the length of first name for employees where last name contain character ‘b’ after 3rd position.  
select LAST_NAME , len(FIRST_NAME) as 'LENGTH OF FIRST NAME'
from VASU_EMPLOYEES
where  LAST_NAME like '__b%'

--26.Display first name and experience of the employees. 
select FIRST_NAME, year(YEAR_OF_RELIEVING)-year(YEAR_OF_JOINING) experience from JENI_EMPLOYEES;


--27.Display employees who joined in the month of May.  
SELECT *
FROM VASU_EMPLOYEES
where (month(YEAR_OF_JOINING))=5

--28.write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name. 
select ID, FIRST_NAME ,LAST_NAME
from VASU_EMPLOYEES
where SALARY > (select avg(SALARY) from VASU_EMPLOYEES)

--29.Difference between primary key and Foreign key with exmple. 
 create table VASU_EMP1 (EMP_ID int PRIMARY KEY ,EMP_NAME varchar(20))
 create table VASU_DEP1 ( EMP_ID int FOREIGN KEY  REFERENCES VASU_EMP1(EMP_ID),DEP_NAME varchar(20))
 insert into VASU_EMP1 values (101,'VASU')
 insert into VASU_EMP1 values (102,'PRABHA')
 insert into VASU_EMP1 values (103,'MITHRA')
 select * from VASU_EMP1
 insert into VASU_DEP1 values (101,'IT')
 insert into VASU_DEP1 values (102,'FINANCE')
 insert into VASU_DEP1 values (103,'SALES')
 select * from VASU_DEP1

--30.Repalce ‘null’ value to ‘AAA’  
  update VASU_EMPLOYEES set FIRST_NAME=null where ID=12
  select*from VASU_EMPLOYEES
 
--31.Create View table for ID,FIRST_NAME,LAST_NAME, DEPARTMENT_ID,DEPARTMENT_NAME. 
create view [EMP_VIEWS] as   
select E.ID,FIRST_NAME,E.LAST_NAME,D.DEPARTMENT_ID,D.DEPARTMENT_NAME 
from VASU_EMPLOYEES as E inner join VASU_DEPARTMENTS as D on E.DEPARTMENT_ID= D.DEPARTMENT_ID
select * from EMP_VIEWS

--32.Create SYNONYMS for EMPLOYEE table. 
 create synonym VASU_EMPLOYEES_TABLE for VASU_EMPLOYEES 
 select * from VASU_EMPLOYEES_TABLE

--33.Create a procedure for who are joined between 2 dates. 
  alter procedure VASU_PROC as 
  begin
  select*from VASU_EMPLOYEES
  where YEAR_OF_JOINING between '2003-10-01 01:30:00.000 ' and '2003-10-21 01:30:00.000 '
  end
  exec VASU_PROC


--34.Create a procedure for insert a rows in Department table. 
  alter procedure VASU_INSERT_VALUE as
  begin 
  insert into VASU_DEPARTMENTS values (26,119,'Technical')
  end
  exec VASU_INSERT_VALUE

--35.write a query for convert ‘2006-12-30 00:38:54.840’ to 20061230003854  
  select replace(convert(varchar, '2006-12-30',101),'-','') + replace(convert(varchar, '00:38:54',108),':','');	