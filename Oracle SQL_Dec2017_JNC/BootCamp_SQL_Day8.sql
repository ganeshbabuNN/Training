 --ASSIGNMENT expression in the subquery
 
---Question by DIvya on functions
 ---NLS-- questions
 
 select 'SESSION' SCOPE,nsp.* from nls_session_parameters nsp;

select 'DATABASE' SCOPE,ndp.* from nls_database_parameters ndp;

select 'INSTANCE' SCOPE,nip.* from nls_instance_parameters nip;

---TRANSLATE 
--replaces one charater at one time
SELECT translate ('1divya231i','1i23','OABC') from dual;
---output - OdAvyaBC
/*
--Translate is a function --> alogorithmn
1-->[O]
i-->[A]
----

-- 1divya231i as array .. and it is accessed by index , whilesing
 name[6]='1divya231i'
 name[0]=1 ---> find and replace with the search array.0
 name[1]=d
 --
 
 --
 
 contact = concat(name[0],name[1],......)
 
 
 --nchar supports stores unicode character whereas char support normal charaters
 */
 CREATE TABLE table_1 (char_col  CHAR(20), nchar_col nchar(20));
 INSERT INTO table_1 VALUES ('Hello', N 'Welcome');
 SELECT * FROM table_1;
 UPDATE table_1 
 SET nchar_col = TRANSLATE(char_col USING NCHAR_CS);
 
 ---Using clause
 select * from employees;
 select * from jobs;
 
 select * from employees join jobs 
 using (job_id);
 
 ---Regular expression
 
 select replace('DivyaGood','Good','Super') from dual;
 
select replace(' DivyaGood ','G','Super') from dual;

select replace('DivyaGood','D','ganes') from dual;

---to overcome this regular expression 

--Regexp_replace(string,pattern,[,replacement_string,[,string_position [,nt appearnce]......)
--'c'--case senstive ....'i'-performa

select regexp_replace('DivyaGood','i','d','ganes') from dual;---- not working

---# --- '\d'
select regexp_replace('Divya score 1 , 2 and 3 in Software','\d','#') from dual;

---oracle regular expressionn
--https://docs.oracle.com/cd/B19306_01/server.102/b14200/ap_posix.htm#g693775 ---oracle

---subquery with multicolumn

select first_name,
       last_name
from employees 
where department_id IN
(select department_id from departments
where department_id < 50);

---BETWEEN Operator
---CASE EXPRESSIONS in subquery

select * from employees;
/*
if salary is more then  < 5000 - Low Salary
                         > 5000 and < 10000  - Medium Salary
                         >10000 - High salary
                         
                         status
*/

---how to CASE
select first_name || ',' || last_name "Employee Name" 
       ,email || '@abc.com' "Email"
       ,salary
       ,case 
       when  salary< 5000 then 'Low Salary'
       when  salary  between 5000 and 10000 then 'Medium Salary'
       when salary >10000 then 'High Salary'
       else ' ' 
       end "status"
from employees;

--how subquery has been used for case
select first_name || ',' || last_name "Employee Name" 
       ,email || '@abc.com' "Email",
       department_id
       ,(case 
       when  department_id IN (Select department_id from departments) then 'Available'
       else 'non-Available' 
       end )"department status"
from employees;

select department_id from departments;

---subquery in ORDER BY 

select * from employees;

select * from jobs;

select first_name,
       last_name,
       job_id
from employees e
order by (select min_salary from jobs where job_id=e.job_id);--COR-RELATED Query


--UPDATE/DELETE STATEMENT in subquery

 CREATE TABLE table_1 (char_col  CHAR(20), nchar_col nchar(20));
 delete table_1;
 INSERT INTO table_1 VALUES (1, 2);
 INSERT INTO table_1 VALUES (2, 4);
select * from table_1;


---ASSIGNMENT
update table_1
set nchar_col = (select replace(nchar_col,'Hello',3) from table_1)
where char_col='Hello';


---WE ARE DONE WITH SUBQUERY ---- RELOOK AGIN -- VERY IMPORT CONCEPT --inter



 









