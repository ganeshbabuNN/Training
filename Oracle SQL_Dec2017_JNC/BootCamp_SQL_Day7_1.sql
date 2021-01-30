---subquery
--its is nested query or sql statmenet held with other sql statement
---WHERE clause -- inner query
---FROM clause --In line view
---SELECT Clause-- --CORRELATED SUbqueries,Having,FROM

--WHERE clause behaviour of the subquery are

---IN Clause
--- = operator
--- EXISTS clause
----Single row or multiple rows values.

----WHERE ... filter or restrict or search..

---FROM clause
select first_name,last_name,salary,department_id from employees e
where exists
(select * from job_history where employee_id=e.employee_id and department_id=60);

select first_name,
       last_name,
       department_id 
from employees e;

select department_name,department_id from departments;

---a subquery which is from the FROM Clause of the select statement is called as in-line view
select first_name,
       last_name,
       e.department_id,
       b.department_name
from employees e ,
(select department_name,department_id from departments) b ---- In-line view
where  e.department_id=b.department_id;

---Skyward publications 
---ASSIGNMENT to get the manager name and department name
select * from employees;

-- Subquery with HAVING clause
---GROUP BY and HAVING Clause

select * from employees;--employees information

select * from jobs; ---min and max

----get the maximum paid job role in that organisation
select first_name,
       last_name,
       job_id,
       salary
from employees
where job_id IN 
(select job_id 
from jobs
group by job_id
having sum(min_salary) < 
(select max(max_salary) from jobs));

select job_id,min_salary from jobs;
select job_id,
       sum(max_salary)
from jobs
group by job_id
having sum(min_salary) < 
(select max(max_salary) from jobs)) ;

----getting the employee information where job_id where maximum slab with more then 10000
select first_name,
       last_name
from employees
where job_Id IN
(select job_id
from jobs
group by job_id
having sum(max_salary) > 10000);

--CORRELATED SUbqueries
--is dependent upon the main query
-- EXISTS clause
-- Comparsion > ,<

select * from employees;

select * from departments;

select first_name,
       last_name,
       department_id
from employees e
where EXISTS
(select department_id 
 from departments
 where department_id=e.department_id)
 
 select first_name,
       last_name,
       department_id
from employees e
where NOT EXISTS
(select department_id 
 from departments
 where department_id=e.department_id);
 
 ---mathematical concept
--LHS and RHS
-- 2 > 4 = FALSE
-- 2 < 4 = TRUE
---comparion operation  < ,> ,>= in subquery

--ASSSIGNMENT 
 select first_name,
       last_name,
       department_id
from employees e
where department_ID <  
(select min(department_id)-- sub query 
 from departments
 where department_id=e.department_id);
 
 select Max(department_ID) from departments;
 
 --ASSIGNMENT expression in the subquery
 
 

 









