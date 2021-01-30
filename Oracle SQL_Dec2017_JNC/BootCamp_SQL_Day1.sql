----retrieve data
--select [column_name] from [table_name]
select email,first_name,last_name from employees;
select * from employees;

select status from employees;
---cacluation
--alias
select first_name as Employee_name, salary, salary * 0.15 as incentives from employees;

select first_name as Employee_name, salary, salary * 0.15  "Incentives"  from employees;

--ordering
-- ASC ascending this is by default
--- DESC descending this is not by default
--postion notation or column name 
select first_name as Employee_name, 
       salary, 
       salary * 0.15 as incentives 
from employees
order by 2 DESC; 

--describe 
desc employees;

--case sensitity
select firsT_name,LAst_naME,department_id from eMPLOYeeS;

select firsT_name,LAst_naME from eMPLOYeeS where deparment_id= 'it_prog';--

--security
---data , or , software, user crendentials

--creating table-- from one table to another new table.
select employee_id,first_name,last_name,email from employees;

create table employees_new1 
(
  employee_id number(6),
  first_name varchar2(20),
  last_name varchar2(25)
);

select * from employees_new1;

create table employee_new2 as 
select employee_id,first_name,last_name,email from employees;

select * from employee_new2;

---filtering

select * 
from employees
where job_id = 'IT_PROG';


select first_name,last_name,manager_id,department_id 
from employees
where job_id = 'IT_PROG';

---want employee_name
select first_name ||' ' || last_name as employee_name,manager_id,department_id 
from employees
where job_id = 'IT_PROG';

select count(employee_id)
from employees
where job_id = 'IT_PROG';

--counts of department
select department_id from employees;

--unique data
select distinct department_id from employees;

---removing null
select distinct department_id from employees where department_ID is not null;

select count(department_id) from employees;

select count(distinct department_id) as department_Count from employees where department_ID is not null;

select department_id,manager_id,employee_id from employees;

--group by-level1
select distinct department_id,
       count(distinct employee_id) as count_of_employees
from employees
where department_id is not null
group by department_id
order by 2 desc;

--group by department, manager,
select distinct department_id,
       manager_id,
       count(distinct employee_id) as count_of_employees
from employees
where department_id is not null
group by department_id,manager_Id
order by 1 desc;

--count of employee who are more the 4000 --> fire
--group by department --error
select  department_id,
       count( employee_id) as count_of_employees,
       salary
from employees
where salary > 4000;

select department_id,count(*) from employees;

select distinct department_id,
       count(distinct employee_id) as count_of_employees 
from employees
where salary > 4000 and department_id is not null
group by department_id;


----assignment
--filter for non IT_PROG with employee name, salary, location
--get the count of the employees of the non-admin 
--list by department id of the max salary of that department id