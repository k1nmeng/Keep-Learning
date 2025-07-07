-- Daily Learning for SQL (15 Minutes)

-- create table for dept 
create table dept(
	DEPTNO INT,
	DNAME CHAR(20),
	LOC CHAR(20)
);

-- create table for emp
create table emp(
	EMPNO INT,
	ENAME CHAR (40),
	JOB CHAR(40),
	MGR INT,
	HIREDATE DATE,
	SAL INT,
	COMM INT, 
	DEPTNO INT
);

-- 1) Display all the information of the EMP table?
select *
from emp;

-- 2) Display unique job from emp table?
SELECT DISTINCT job
FROM emp;

-- 3) List the employee in the ascending order of their salaries
SELECT ename,
	sal
FROM emp
ORDER by sal asc;

-- 4) List the details of the emps in asc order of the Dptnos and desc ofJobs?
SELECT *
FROM emp
ORDER BY DEPTNO ASC, JOB desc;

-- 5) Display all the unique job groups in the descending order?
SELECT DISTINCT job
FROM emp
ORDER BY job desc;

-- 6 Display all the details of all ‘Mgrs’
SELECT *
FROM emp
WHERE job = 'MANAGER';

-- 7)List the emps who joined before 1981.
SELECT * 
FROM emp
WHERE hiredate < '(01-Jan-1981';

-- 8) List the EMPNO, ENAME, SAL of all employees in the ascending order of Annual Salary
SELECT empno AS Employee_Number,
	ename AS Employee_Name,
	sal * 12 AS Annual_Salary
FROM emp
ORDER BY Annual_Salary asc;

-- 9)List out EMPNO , Ename, job , hiredate and experience (Months) of all managers
SELECT empno as employee_number,
	ename as employee_name,
	job,
	hiredate,
	DATE_PART('year', AGE(CURRENT_DATE, hiredate)) * 12 + DATE_PART('month', AGE(CURRENT_DATE, hiredate)) AS experience_months
FROM emp
WHERE job = 'MANAGER';


-- 10) List the Empno, Ename, Sal, Exp of all emps working for Mgr 7839
SELECT empno AS employee_number,
	ename AS employee_name,
	sal as Salary,
	date_part('year', AGE(CURRENT_DATE, hiredate)) * 12 + DATE_PART('month', AGE(CURRENT_DATE, hiredate)) as exerience_months
FROM emp
WHERE MGR = 7839;

-- 11) List out all details of the employess where their commission is more than salary
SELECT *
FROM emp
WHERE COMM > SAL;

-- 12) List out all employess in the ascending Of Job for those who joined after 2nd half of 1981
SELECT *
FROM emp
WHERE hiredate >('30-Jun-1981') 
ORDER BY job asc;

-- 13) List out the employee that their daily salary is more than $100 (sal/30)
SELECT * 
FROM emp
WHERE sal/30 > 100;

-- 14) List out all the employee who are "ANALYST" or "CLERK" and order by job DESC
SELECT *
FROM emp
WHERE job='ANALYST' or job='CLERK'
ORDER BY job DESC;

-- 15) List the emps who joined on 1-MAY-81, 3-DEC-81, 17-DEC-81, 19-JAN-80 in ascending ordeer of experience seniority
SELECT *
FROM emp
WHERE hiredate in(
	'1-MAY-81',
	'3-DEC-81',
	'17-DEC-81',
	'19-JAN-80')
ORDER BY hiredate asc;

-- 16) List out all employee that are working in Dept no 10 or 20. Sort Dept No ascending
SELECT *
FROM emp
WHERE deptno='10' OR deptno='20'
ORDER BY deptno ASC;

-- 17) List out employee who joined in the year of 1981
SELECT *
FROM emp
WHERE hiredate between '01-Jan-81' AND '31-Dec-91'
ORDER by hiredate;

-- 18) List out the employee who are joined in the month of Dec 1980
SELECT *
FROM emp
WHERE hiredate between '01-Dec-80' AND '31-Dec-80';

-- 19) List out all employee where annual salary ranging from 22,000 and 45,000
SELECT *
FROM emp
WHERE sal*12 between 22000 and 45000;

-- 20) List all employee name where the name is 5 characters long
SELECT ename AS employee_name
FROM emp
WHERE length(ename)=5
ORDER BY ename;

-- 21) List the employees those are starting with ‘S’ and with five characters.
SELECT ename AS employee_name
FROM emp
WHERE ename LIKE 'S%' AND length(ename)=5
ORDER by ename;

-- 22) List the employee name those are having four characters and third character must be ‘R’
SELECT ename as employee_name
FROM emp
WHERE length(ename) = 4 AND ename LIKE '__R%'
ORDER by ename;

-- 23) List employee names with the 5character names starting with ‘S’ and ending with ‘H’
SELECT ename as employee_name
FROM emp
WHERE length(ename) = 5 AND ename LIKE 'S___H%'
ORDER BY ename;

-- 24) List the employee who joined in January.
SELECT ename as employee_name,
	hiredate as hiring_date
FROM emp
WHERE to_char(hiredate,'mon') = 'jan'
ORDER BY ename;

-- 25) List the employee who joined in the month of which second character is ‘a’
SELECT ename as employee_name,
	hiredate as hiring_date
FROM emp
WHERE to_char(hiredate,'mon') LIKE '_a%'
ORDER by ename;