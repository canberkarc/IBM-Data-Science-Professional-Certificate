/*Query 1A: Select the names and job start dates of all employees who work for
the department number 5.*/
SELECT E.F_NAME, E.L_NAME, JH.START_DATE  FROM EMPLOYEES as E INNER JOIN JOB_HISTORY JH ON E.DEP_ID = JH.DEPT_ID = 5;

/*Query 1B: Select the names, job start dates, and job titles of all employees
who work for the department number 5.*/
SELECT E.F_NAME, E.L_NAME, JH.START_DATE, J.JOB_TITLE  FROM EMPLOYEES as E INNER JOIN JOB_HISTORY as JH ON E.EMP_ID=JH.EMPL_ID  INNER JOIN JOBS as J ON J.JOB_IDENT =  JH.JOBS_ID where E.DEP_ID ='5';

/*Query 2A: Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT
tables and select employee id, last name, department id and department name
for all employees*/
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID,  D.DEP_NAME FROM EMPLOYEES as E LEFT JOIN DEPARTMENTS  as D ON E.DEP_ID =  D.DEPT_ID_DEP;

/*Query 2B: Re-write the query for 2A to limit the result set to include only the
rows for employees born before 1980.*/
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME FROM EMPLOYEES as E LEFT JOIN DEPARTMENTS as D ON E.DEP_ID=D.DEPT_ID_DEP  where YEAR(E.B_DATE) < 1980;

/*Query 2C: Re-write the query for 2A to have the result set include all the
employees but department names for only the employees who were born before 1980.*/
SELECT E.EMP_ID, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME FROM EMPLOYEES as E LEFT JOIN DEPARTMENTS as D ON  E.DEP_ID=D.DEPT_ID_DEP AND YEAR(E.B_DATE) < 1980;

/*Query 3A: Perform a Full Join on the EMPLOYEES and DEPARTMENT tables
and select the First name, Last name and Department name of all employees.*/
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME FROM EMPLOYEES E FULL JOIN DEPARTMENTS D ON E.DEP_ID=D.DEPT_ID_DEP ;

/*Query 3B: Re-write Query 3A to have the result set include all employee
names but department id and department names only for male employees.*/
SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M' ;