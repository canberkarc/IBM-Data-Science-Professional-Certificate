/*
Query 1: Retrieve all employees whose address is in Elgin,IL

Query 2: Retrieve all employees who were born during the 1970's.

Query 3: Retrieve all employees in department 5 whose salary is between 60000 and 70000 .

Query 4A: Retrieve a list of employees ordered by department ID.

Query 4B: Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in
descending order by last name.

Query 5A: For each department ID retrieve the number of employees in the
department.

Query 5B: For each department retrieve the number of employees in the department, and the average employees salary in the department.

Query 5C: Label the computed columns in the result set of Query 5B as “NUM_EMPLOYEES” and “AVG_SALARY”.

Query 5D: In Query 5C order the result set by Average Salary.

Query 5E: In Query 5D limit the result to departments with fewer than 4 employees.

Query 6: Similar to 4B but instead of department ID use departmentname. 
Retrieve a list of employees ordered by department name, and withineach department ordered alphabetically in descending order by last name.
*/



/* Creating tables for data*/
/* Data will be uploaded to IBM Db2*/
CREATE TABLE EMPLOYEES (
                EMP_ID CHAR(9) NOT NULL, 
                F_NAME VARCHAR(15) NOT NULL,
                L_NAME VARCHAR(15) NOT NULL,
                SSN CHAR(9),
                B_DATE DATE,
                SEX CHAR,
                ADDRESS VARCHAR(30),
                JOB_ID CHAR(9),
                SALARY DECIMAL(10,2),
                MANAGER_ID CHAR(9),
                DEP_ID CHAR(9) NOT NULL,
                PRIMARY KEY (EMP_ID));
                
CREATE TABLE JOB_HISTORY (
                EMPL_ID CHAR(9) NOT NULL, 
                START_DATE DATE,
                JOBS_ID CHAR(9) NOT NULL,
                DEPT_ID CHAR(9),
                PRIMARY KEY (EMPL_ID,JOBS_ID));

CREATE TABLE JOBS (
                JOB_IDENT CHAR(9) NOT NULL, 
                JOB_TITLE VARCHAR(15) ,
                MIN_SALARY DECIMAL(10,2),
                MAX_SALARY DECIMAL(10,2),
                PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                DEPT_ID_DEP CHAR(9) NOT NULL, 
                DEP_NAME VARCHAR(15) ,
                MANAGER_ID CHAR(9),
                LOC_ID CHAR(9),
                PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                LOCT_ID CHAR(9) NOT NULL,
                DEP_ID_LOC CHAR(9) NOT NULL,
                PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            

-- Query 1------
;
select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;
--Query 2--
;
select F_NAME , L_NAME
from EMPLOYEES
where B_DATE LIKE '197%' ;
---Query3--
;
select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;
--Query4A--
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID;
--Query4B--
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID desc, L_NAME desc;
--Query5A--
;
select DEP_ID, COUNT(*)
from EMPLOYEES
group by DEP_ID;
--Query5B--
;
select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;
--Query5C--
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID;
--Query5D--
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;
--Query5E--
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
having count(*) < 4
order by AVG_SALARY;
--5E alternative
select DEP_ID, NUM_EMPLOYEES, AVG_SALARY from
  ( select DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY from EMPLOYEES group by DEP_ID)
  where NUM_EMPLOYEES < 4
order by AVG_SALARY;
--Query6--
;
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;










































