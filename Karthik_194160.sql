Display details of jobs where the minimum salary is greater than 10000.

SELECT * FROM JOBS WHERE MIN_SALARY > 10000
-----------------------------------------------------------------------------


Display the first name and join date of the employees who joined between 2002 and 2005.

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES 
         WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2002 AND 2005 ORDER BY HIRE_DATE
----------------------------------------------------------------------------------

Display first name and join date of the employees who is either IT Programmer or Sales Man.

SELECT FIRST_NAME, HIRE_DATE
         FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG', 'SA_MAN')
----------------------------------------------------------------------------------

Display employees who joined after 1st January 2008.

SELECT * FROM EMPLOYEES  where hire_date > '01-jan-2008' 

----------------------------------------------------------------------------------

Display how many employees joined in each month of the current year.

SELECT TO_CHAR(HIRE_DATE,'MM'), COUNT (*) FROM EMPLOYEES 
         WHERE TO_CHAR(HIRE_DATE,'YYYY')= TO_CHAR(SYSDATE,'YYYY') GROUP BY TO_CHAR(HIRE_DATE,'MM')
----------------------------------------------------------------------------------

Display job ID for jobs with average salary more than 10000.

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES 
         GROUP BY JOB_ID 
         HAVING AVG(SALARY)>10000
----------------------------------------------------------------------------------

Change salary of employee 115 to 8000 if the existing salary is less than 6000.

UPDATE EMPLOYEES SET SALARY = 8000 WHERE EMPLOYEE_ID = 115 AND SALARY < 6000

----------------------------------------------------------------------------------
Display departments where any manager is managing more than 5 employees.

SELECT FIRST_NAME FROM EMPLOYEES 
         WHERE EMPLOYEE_ID IN 
         (SELECT MANAGER_ID FROM EMPLOYEES 
          GROUP BY MANAGER_ID 
         HAVING COUNT(*)>5)

----------------------------------------------------------------------------------
Display details of departments managed by ‘Smith’.

    SELECT * FROM DEPARTMENTS WHERE MANAGER_ID IN 
             (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE FIRST_NAME='SMITH')
----------------------------------------------------------------------------------

Display employee name, job title, start date, and end date of past jobs of all employees with commission percentage null.

SELECT FIRST_NAME, JOB_TITLE, START_DATE, END_DATE
          FROM JOB_HISTORY JH JOIN JOBS J USING (JOB_ID) JOIN EMPLOYEES E  ON ( JH.EMPLOYEE_ID = E.EMPLOYEE_ID)
          WHERE COMMISSION_PCT IS NULL