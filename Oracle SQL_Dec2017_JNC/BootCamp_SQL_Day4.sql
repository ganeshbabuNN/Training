--WHAT IS GITHUB
--IT IS SUB-VERSIONING SYSTEM
--ASSUME YOU HAVE 40 DEVELOPMENT IN TEAM, WORKING DIFFERENT MODULES
-- GIT,GITHUB, SVN, CVS, MERCURIAL....ETC


--ASSSIGNMENT
-- * ???*Columns listed in the GROUP BY clause need not be listed in the SELECT Statement
select job_ID,sum(salary) from employees
group by job_id,employee_id
order by 2 desc;
--check again
-----??*the group functions listed in the HAVING clause need to be listed in the SELECT statement
select job_ID,sum(salary) as sum_salary from employees
group by job_id 
having sum(salary) > 100000
order by 2 desc;
--- CREATE YOUR OWN GITHUB ACCOUNT AND Sync your own code
------ steps 1 create your own account
------- create the repository as public
------ DOwnlaod the github desktop software or command line 
------ clone your repository which you created wit your own location added
----- add some changes into and play around.

--SQL Operator
--1)Arithematic Operators

--2)Logical operator
--Write a query to know the employees starts with letter s and hire_date joining year should 1997 +
---range of salary (7000-13000) or  (2000-3000)
select first_name,
       hire_date,
       sum(Salary)
from employees
where extract(year from hire_date)=1997 and first_name LIKE 'S%'
group by first_name,hire_date
having ((sum(salary)) >7000 and (sum(salary))<13000 ) 
or ((sum(salary)) >2000 and (sum(salary))<3000) ;

--3)Comparison operators
--NULL
select first_name,manager_id
from employees
where manager_id is null;

select first_name
from employees
where manager_id='';

select * from employees;

create table divya(
Id number(10),
name varchar2(30)
);

insert into divya values(32,'ganesh' );
insert into divya values('','jnc' );
insert into divya values(3,'');
insert into divya values(4,' ');
insert into divya values(null,'sud');---observe
insert into divya values(5,'');---observe
insert into divya values(6,null);---observe
insert into divya values(6,'sadn');---observe

--null is a keyword which will be playing a role in blank values by the database/compiler engine

select * from divya
where name like 's_d';


--ASSIGNMENT 1- LIKE BETWEEN-- -- exaple a to f
--ASSIGNMENT 2-  Escape Character

---4)Date Operator
select first_name,
       hire_date,
       hire_date + (365 * 3),
       hire_date + (30-00-0000)
from employees;

--ASSIGNMENT-3-OBSERVE STEPS --- DECODE is like if statement--nested decode statement
SELECT EXTRACT(YEAR FROM hire_date),
	DECODE(MOD(EXTRACT(YEAR FROM hire_date), 4),  0,
		DECODE(MOD(EXTRACT(YEAR FROM hire_date), 400),  0,  'Leap Year',
			DECODE(MOD(EXTRACT(YEAR FROM hire_date), 100), 0, 
				'Not a Leap Year', 'Leap Year')), 'Not a Leap Year') 
					AS "Leap Year Indicator"
						FROM Employees;

select first_name,
       job_id,
       decode(job_id,'SA_REP','Begger',
                      'ST_CLERK','Hard worker') as prefrred_title
       from employees;


---4)LIKE Operator
select first_name
from employees
where first_name like 'S%';

select first_name
from employees
where first_name like 'S_r';
--5)in NAN and is infinite Operators
select 1/0 from dual;

create table bankbook(
bookno number(10) PRIMARY KEY,
accountno varchar2(10),
bookdate date,
opbal BINARY_FLOAT,
clbal BINARY_DOUBLE);


insert into bankbook(bookno,accountno,bookdate,opbal,clbal)
values (5,'GB105','03-jan-2008',BINARY_FLOAT_NAN,BINARY_DOUBLE_NAN);
insert into bankbook(bookno,accountno,bookdate,opbal,clbal)
values (6,'GB106','08-jan-2008',BINARY_FLOAT_INFINITY,BINARY_DOUBLE_INFINITY);

select * from bankbook;

select BINARY_FLOAT_NAN+1 from dual;

drop table bankbook;
---6)Operator Precedance
--(5+1) * (5-2-23)

--SET OPERATORS
--UNION,INTERSECT, MINUS , OTHER CLAUSE IN , EXISTS

--UNION--unique values and common values
select * from employees;

select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='IT_PROG'
UNION
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='FI_ACCOUNT'
union 
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id like '%ASST%';

select * from employees;

--UNION - ALL--allows duplicates
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='IT_PROG'
UNION ALL
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='FI_ACCOUNT' ;

--INTERSECT--common records on both the dataset
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='IT_PROG'
INTERSECT
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='FI_ACCOUNT' or job_id='IT_PROG';


--MINUS---ASSIGNMENT-4
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='IT_PROG'
MINUS
select first_name ||', ' || last_name,email,hire_date,job_ID from employees where job_id='FI_ACCOUNT';

--alternate
select first_name ||', ' || last_name,email,hire_date,job_ID from employees 
where job_id='IT_PROG' or job_id='FI_ACCOUNT' or job_id like '%ASST%';

select first_name ||', ' || last_name,email,hire_date,job_ID from employees 
where job_id='IT_PROG' or job_id='FI_ACCOUNT' or job_id='IT_PROG' or job_id='ST_CLERK';

--IN 
select first_name ||', ' || last_name,email,hire_date,job_ID from employees 
where job_id='IT_PROG' or job_id IN ('FI_ACCOUNT','IT_PROG','ST_CLERK',null);

--EXISTS ---ASSIGNMENT-6
select employee_id,first_name ||', ' || last_name,email,hire_date,job_ID 
from employees 
where exists (select employee_id from employees where  job_id IN ('FI_ACCOUNT','IT_PROG','ST_CLERK',null));

--challenge will only on the different tables.

--FUnctions like character/string , numeric ,date functions.








