---WE ARE DONE WITH SUBQUERY ---- RELOOK AGIN -- VERY IMPORT CONCEPT --inter
--Data Constraints ---NOT DONE--LATER
--Synonyms

---objects are like tables, views, procedure,....etc in DB
--if you want to give some alternative name for this objects , you can synomyms


-- public -another alternative way for optimizing the query---
create public SYNONYM employeedetails
for employees;

---private
create SYNONYM eemployeedetails
for employees;
select * from employeedetails;

---VIEWs
---another alternative way for optimizing the query---more efficient...
create view employee_US as
select first_name,   ---main outer query
       department_id 
from employees
where department_Id IN (
select department_id   --- 1s subquery
from departments
where location_id in (
select location_id ---2nd subquery
from locations
where country_id ='US')
);

select * from employee_US;

---JOINS
--in subquery

/*
---select ...
  from table1 a,
  (select ..... from table 2 where table2=table1. ).
*/

-- A Join in a sql query that combines data from two or more tables.
-- one table ???? Simply query...
--- the same table with a same table ---> SELF-JOIN

--TYPE of JOIN
--1)INNER JOIN
--2)OUTER JOIN--> left, right , full
--3)CROSS JOIN ---> matrix row X column
--4)SELF JOIN  ---> confusion table talking by itself

--Style of join -- 1)ANSI Style(standard ) 2)Theta Style(oracle specific or vendor specific)

--inner 
--assume there tables, you have the common column, when you join, only the match rows/records of the both the table will return.


select * from employees;
select * from jobs;
select * from departments;

--ANSI Style
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.department_name
from employees e inner join departments d
on e.department_id=d.department_id;

---without alias
select employees.first_name ||', ' || employees.last_name "Employee_Name",
       departments.department_name
from employees inner join departments 
on employees.department_id=departments.department_id;

---USING clause without join
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.department_name
from employees e join departments d
using(department_id);

---Theta Style
--============
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.department_name
from employees e , departments d
where e.department_id=d.department_id;


--ASSIGNMENT different between INNER JOIN and SELF JOIN
---OUTER JOIN
---- A and B
--- you want all the records of A to be matched to B and not matched B-- Left outer join
--- you want all the records of B to be matched to A and not matched A-- right outer join
--- you want all the records matched or not matched between A and B tables-- full join/full outer join
---outer join there three types, left, right , full

-----left join
--Left join will return all the values of the left tables, Plus matching values of the right tables
--ANSI Style
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.department_name
from employees e left outer join departments d
on e.department_id=d.department_id;

---contract period for each employees
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from employees e left join job_history d
on e.employee_ID=d.employee_ID;

---ASSIGNMENT on LEFT JOIN
--on the above,show only which are contract employees and other new query for non-contact employees
--New query for count of contracts and non-contract employees.
--- display sum of the salary of each department_name 

select * from employees;
select * from job_history;

--Theta style
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from employees e, job_history d
where e.employee_ID=d.employee_ID(+);

---RIGHT JOIN
----opposite to left join---
--Right join will return all the values of the right tables, Plus matching values of the left tables
---- display sum of the salary of each department_name 

--ANSI style
---contract period for each employees
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from  job_history d right outer join employees e
on e.employee_ID=d.employee_ID;


--Theta style
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from employees e, job_history d
where e.employee_ID(+)=d.employee_ID;

--ASSIGNMENT on Right join
--New query for count of contracts and non-contract employees.


--FULLL OUTER JOIN

--ANSI style
---contract period for each employees
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from employees e full outer join job_history d
on e.employee_ID=d.employee_ID;

--divya question
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from job_history d full outer join employees e 
on e.employee_ID=d.employee_ID;

---ASSIGNMENT on FULL OUTER JOIN
---how to write in the theta style
------ display sum of the salary of each department_name 

--DIVYA answer ----> WRONG
select e.first_name ||', ' || e.last_name "Employee_Name",
       d.start_date,
       d.end_date
from employees e,job_history d
where e.employee_ID(+)=d.employee_ID(+);


----3)CROSS JOIN
---it combines every row from the left table with every row to the right table.
--> If A --> 3 rows   X B ---> 4 Rows
--> 3 X 4 = 12 rows ..
-- Even this is also called catersian product

--ANSI style
---contract period for each employees
select first_name ||', ' || last_name "Employee_Name", start_date,end_date
from employees  cross join job_history ;

select * from job_history;
select * from employees;

--> 107 * 10 = 1070

--Theta style
---contract period for each employees
select first_name ||', ' || last_name "Employee_Name", start_date,end_date
from employees,job_history ;

--ASSIGNMENT on CROSS JOIN
--- get a count of unique employee_name name with unique start_date and end_date

--4)Self Join
-------------
-- join the same table by itself is called self join
-- under each manager ID , how many employess are there , give a count of it.

select * from employees;

---analyise divya
select e.employee_id,
       e.first_name ||', ' || e.last_name "Employee_Name",
       m.manager_id,
       m.first_name ||', ' || m.last_name "Manager Name"
from employees e left join employees m
on e.employee_id=m.manager_id
order by 1;

--ANSI Style---this confusion SELF join
select e.employee_id,
       e.first_name ||', ' || e.last_name "Employee_Name",
       m.employee_id " Manager ID" ,
       m.first_name ||', ' || m.last_name "Manager Name"
from employees e inner join employees m
on m.employee_id=e.manager_id
order by 1;

---actual one--theta style
select e.employee_id,
       e.first_name ||', ' || e.last_name "Employee_Name",
       m.employee_id "Manager_ID" ,
       m.first_name ||', ' || m.last_name "Manager Name"
from employees e , employees m
where e.manager_id = m.employee_id
order by 1;

--ASSINGMENT on SELF JOIN
---new query report how many employees under each manager

--Non-equi joins
---it uses an operator other then equal operatorin in join
--not equal <>
--less than <
---greater than  >
--> less <
---> LIKE, IN , BETWEEN 

select * from employees;
select * from jobs;

---to display the minimum salary of all the employees betwen 1 and 10000

select first_name,last_name,min_salary
from employees,jobs
where min_salary between 1 and 10000;













  


 









