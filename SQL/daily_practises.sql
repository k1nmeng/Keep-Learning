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
	