select job_ID,sum(salary) from employees
group by job_ID
order by 2 desc;

---dataset, resultset, output

select department_ID, salary from employees
group by department_id
order by 1 ;

---Group by clause always want an aggregation function like max, min, sum,count...etc

---CEO want to know the on each mangaer of that role what is total salary company is investing on it.
select department_ID,job_id,salary from employees 
order by 1 ;

select department_ID,job_id,sum(salary) from employees
group by department_id,job_id
order by 1 ;

select department_ID,job_id,count(employee_id) from employees
group by department_id,job_id
order by 1;

--having

--this cannot be used as aggregation in WHERE CLAUSE
select department_ID,count(employee_ID) from employees
where count(employee_ID) >10
group by department_id;

select department_ID,COUNT(EMPLOYEE_ID) from employees
where X> 3500;

--NORMAL 

SELECT TABLE_EMP.DEPARTMENT_ID,
        TABLE_EMP.COUNT_EMP 
FROM 
(SELECT DEPARTMENT_ID,COUNT(EMPLOYEE_ID) AS COUNT_EMP FROM EMPLOYEES
              GROUP BY DEPARTMENT_ID) TABLE_EMP
WHERE TABLE_EMP.COUNT_EMP > 10;

--TO AVOID ABOVE QUERY
SELECT DEPARTMENT_ID,COUNT(EMPLOYEE_ID) AS COUNT_EMP FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) > 10;

--ROLLUP
select department_ID,job_id,count(employee_id) from employees
group by ROLLUP(department_id,job_id)
order by 1;

---CUBE
select department_ID,job_id,count(employee_id) from employees
group by CUBE(department_id,job_id)
order by 1;


---WITH
SELECT DEPARTMENT_ID, SUM(SALARY) AS SUM_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2) AVG_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID; 

SELECT ROUND(AVG(SALARY),2) AVG_SALARY FROM EMPLOYEES ; 

---ONE SIMPLE WAY
SELECT DEPARTMENT_ID, 
      SUM(SALARY) AS SUM_SALARY 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) > (SELECT ROUND(AVG(SALARY),2) AVG_SALARY FROM EMPLOYEES);

---WITH CLAUSE
WITH DEPT_TOTAL_SALARY AS 
(SELECT DEPARTMENT_ID, SUM(SALARY) AS SUM_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID),
AVG_SALARY_ALL AS (
SELECT ROUND(AVG(SALARY),2) AVG_SALARY FROM EMPLOYEES)
SELECT DEPARTMENT_ID,SUM_SALARY
FROM DEPT_TOTAL_SALARY
WHERE SUM_SALARY > (SELECT ROUND(AVG(SALARY),2) AVG_SALARY FROM EMPLOYEES);

--SYNTAX
WITH DATSET1 AS ( SELECT .... ),
WITH DATESET2 AS (SELECT ......)
SELECT ....
FROM DATSET1,DATSET2;


WITH Q1 AS 
(SELECT SUM(SALARY) AS SUM_SALARY FROM EMPLOYEES),
Q2 AS (
SELECT ROUND(AVG(SALARY),2) AVG_SALARY FROM EMPLOYEES),
Q3 AS (
SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES
GROUP ),
Q4 AS (
SELECT MIN(SALARY) AS MIN_SALARY FROM EMPLOYEES)
SELECT Q1.SUM_SALARY,
       Q2.AVG_SALARY,
       Q3.MAX_SALARY,
       Q4.MIN_SALARY
FROM Q1,Q2,Q3,Q4;

---DIVYA CHALLENGE
SELECT SUM(SALARY),COUNT(*),MIN(SALARY),MAX(SALARY) FROM EMPLOYEES;


----UPDATE

UPDATE EMPLOYEE_NEW2
SET EMAIL='DIVYA'
WHERE EMPLOYEE_ID=100;

SELECT * FROM EMPLOYEE_NEW2 WHERE EMPLOYEE_ID=100;

---GRANT PRIVLEGES
GRANT UPDATE ON EMPLOYEE_NEW2 TO GANESH;


UPDATE EMPLOYEE_NEW2
SET EMAIL='DIVYA@122.COM',
LAST_NAME='GOD';

SELECT * FROM EMPLOYEE_NEW2

--WHAT IS GITHUB
--IT IS SUB-VERSIONING SYSTEM
--ASSUME YOU HAVE 40 DEVELOPMENT IN TEAM, WORKING DIFFERENT MODULES
-- GIT,GITHUB, SVN, CVS, MERCURIAL....ETC


--ASSSIGNMENT
-- * ???*Columns listed in the GROUP BY clause need not be listed in the SELECT Statement
-----??*the group functions listed in the HAVING clause need to be listed in the SELECT statement
--- CREATE YOUR OWN GITHUB ACCOUNT AND Sync your own code
------ steps 1 create your own account
------- create the repository as public
------ DOwnlaod the github desktop software or command line 
------ clone your repository which you created wit your own location added
----- add some changes into and play around.








