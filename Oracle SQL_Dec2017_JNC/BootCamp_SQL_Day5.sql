---functions

--https://docs.oracle.com/cloud/latest/db112/SQLRF/functions.htm#SQLRF006
--numeric functions
--character functions
--date/set functions
--aggreate functions
--Encoding and Decoding Functions
--NULL-Related Functions

select round(abs(-424.9323),2) from dual;

select trim('       ganesh babu is nothing    ' ) from dual;


---subquery
--its is nested query or sql statmenet held with other sql statement
---WHERE clause
---FROM clause
---SELECT Clause

select * from employees;

select * from departments;

select first_name,
       last_name 
  from employees
  where department_id IN 
  (select department_id from departments where department_name= 'IT' or department_name= 'Sales' ); ---- return multiple row results
  
  select first_name,
       last_name 
  from employees
  where department_id IN (60,80); 
  
    
select first_name,
       last_name 
  from employees
  where department_id = (select department_id from departments where department_name= 'IT' or department_name= 'Sales' ); 
  
---difference IN and = operator
--IN operator will look for muliple values results
-- = operator always look into single value results

select first_name,
       last_name 
  from employees
  where department_id = (select department_id from departments where department_name= 'IT' ); 

---answer this
  select first_name,
       last_name,
       department_id
  from employees
  where department_id = (select max(department_id) from departments ); ---- return single row results
  
---nested query
select first_name,department_id from employees;

select department_id,location_id from departments;

select location_id,country_id from locations;---US

---this kind cases which is called as complex query are designed by nested patterns or query

---complex query --- this only for the people who don't understand and understand called nested query

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

---FROM clause
