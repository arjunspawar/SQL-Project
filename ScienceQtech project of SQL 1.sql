CREATE DATABASE employee;
CREATE TABLE emp_record_table(
	  EMP_ID varchar(5),
      FIRST_NAME varchar(25),
      LAST_NAME varchar(25),
      GENDER char(1),
      ROLE varchar(25),
      DEPT varchar(25),
      EXP int,
      COUNTRY varchar(25),
      CONTINENT varchar(25),
      SALARY float,
      EMP_RATING int,
      MANAGER_ID varchar(5),
      PROJ_ID varchar(5),
      FOREIGN KEY(PROJ_ID) REFERENCES Proj_table(PROJ_ID)
);      
CREATE TABLE proj_table(
	  PROJECT_ID varchar(5),
      PROJ_NAME varchar(25),
      DOMAIN varchar(25),
      START_DATE date,
      CLOSURE_DATE date,
      DEV_QTR varchar(5),
      STATUS varchar(25)
);
CREATE TABLE data_science_team(
      EMP_ID varchar(25),
      FIRST_NAME varchar(25),
      LAST_NAME varchar(25),
      GENDER char(1),
      ROLE varchar(25),
      DEPT varchar(25),
      EXP int,
      COUNTRY varchar(25),
      CONTINENT varchar(25)
);      
select
     EMP_ID,
     FIRST_NAME,
     LAST_NAME,
     GENDER,
     DEPT FROM emp_record_table;
select
	 EMP_ID,
     FIRST_NAME,
     LAST_NAME,
     GENDER,
     DEPT,
     EMP_RATING
     FROM emp_record_table
     WHERE EMP_RATING <2;
select
     EMP_ID,
     FIRST_NAME,
     LAST_NAME,
     GENDER,
     DEPT,
     EMP_RATING
     FROM emp_record_table
     WHERE EMP_RATING >4;
select
	 EMP_ID,
     FIRST_NAME,
     LAST_NAME,
     GENDER,
     DEPT,
     EMP_RATING
     FROM emp_record_table
     WHERE EMP_RATING >=2 AND EMP_RATING <=4;
select
     concat(FIRST_NAME,'', LAST_NAME)
     FROM emp_record_table
     WHERE DEPT='FINANCE';
select
	 employee.EMP_ID,
     concat(employee.FIRST_NAME,'',employee.LAST_NAME)
     AS Employee_Name,
     manager.MANAGER_ID,
     concat(manager.FIRST_NAME,'',manager.LAST_NAME)AS Manager_Name,
     manager.ROLE AS ROLE
FROM emp_record_table employee
JOIN emp_record_table manager
ON employee.MANAGER_ID = manager.EMP_ID;
select
	  *FROM emp_record_table
      where DEPT='HEALTHCARE' OR DEPT='FINANCE';
select
      EMP_ID,
      FIRST_NAME,
      LAST_NAME,
      ROLE,
      DEPT,
      EMP_RATING,
      max(EMP_RATING) 
      OVER(partition by DEPT) 
      AS MAX_EMP_RATING 
      FROM emp_record_table;
select
      ROLE,
      min(SALARY) AS MIN_SALARY,
      max(SALARY) AS MAX_SALARY
   FROM emp_record_table
   group by ROLE;
select
      EMP_ID,
      FIRST_NAME,
      LAST_NAME,
      ROLE,
      DEPT,
	EXP,
    row_number() OVER (order by EXP DESC) AS Ranking
FROM emp_record_table;
create view country_view as select FIRST_NAME,
LAST_NAME,
COUNTRY,
SALARY FROM emp_record_table
WHERE SALARY >6000;
SELECT*FROM country_view;
select*from emp_record_table where emp_id in (select exp >10);
DELIMITER $$
CREATE PROCEDURE get_employee_exp()
begin
select * from emp_record_table WHERE EXP >3;
END$$
CALL get_employee_exp();
DELIMITER $$
CREATE FUNCTION employee_job_profile(EXP int)
RETURNS VARCHAR(50)
DETERMINISTIC 
BEGIN
     DECLARE employee_job_profile VARCHAR(50);
     IF EXP <=2 THEN 
            SET employee_job_profile = 'JUNIOR DATA SCIENTIST';
	 ELSEIF EXP BETWEEN 2 AND 5 THEN
			SET employee_job_profile = 'ASSOCIATE DATA SCIENTIST';
	 ELSEIF EXP BETWEEN 5 AND 10 THEN
			SET employee_job_profile = 'SENIOR DATA SCIENTIST';
	 ELSEIF EXP BETWEEN 10 AND 12 THEN
			SET employee_job_profile = 'LEAD DATA SCIENTIST';
	 ELSEIF EXP BETWEEN 12 AND 16 THEN
            SET employee_job_profile = 'MANAGER';
	  END IF;
      RETURN(employee_job_profile);
END$$
SELECT EMP_ID, FIRST_NAME, EXP, employee_job_profile(EXP)
FROM emp_record_table;
select *from emp_record_table where FIRST_NAME = 'Eric';
select 
      FIRST_NAME,
      LAST_NAME,
      (SALARY*0.05  *  emp_rating) as Bonus 
from emp_record_table;
select continent,
avg(salary) as Average_Salary_By_Continent 
from emp_record_table
group by continent;

select country,
avg(salary) as Average_Salary_by_country
from emp_record_table 
group by country;


      





 

     
create table emp_reocrd_table(EMP_ID varchar(5) PRIMARY KEY, FIRST_NAME VARCHAR(25), LAST_NAME_VARCHAR(25), GENDER CHAR(1), ROLE VARCHAR(25), DEPT VARCHAR(25), EXP INT, COUNTRY VARCHAR(25), COUNTINENT VARCHAR(25), SALARY FLOAT, EMP_RATING INT, MANAGER_ID VARCHAR(5), PROJ_ID VARCHAR(5), FOREIGN KEY(PROJ_ID) PREFERENCEC Proj_table(PROJ_ID) );
create table emp_reocrd_table(EMP_ID varchar(5) PRIMARY KEY, FIRST_NAME VARCHAR(25), LAST_NAME_VARCHAR(25), GENDER CHAR(1), ROLE VARCHAR(25), DEPT VARCHAR(25), EXP INT, COUNTRY VARCHAR(25), COUNTINENT VARCHAR(25), SALARY FLOAT, EMP_RATING INT, MANAGER_ID VARCHAR(5), PROJ_ID VARCHAR(5), FOREIGN KEY(PROJ_ID) PREFERENCEC Proj_table(PROJ_ID) );
create table emp_reocrd_table(EMP_ID varchar(5) PRIMARY KEY, FIRST_NAME VARCHAR(25), LAST_NAME_VARCHAR(25), GENDER CHAR(1), ROLE VARCHAR(25), DEPT VARCHAR(25), EXP INT, COUNTRY VARCHAR(25), COUNTINENT VARCHAR(25), SALARY FLOAT, EMP_RATING INT, MANAGER_ID VARCHAR(5), PROJ_ID VARCHAR(5), FOREIGN KEY(PROJ_ID) PREFERENCEC Proj_table(PROJ_ID) );
CREATE TABLE Proj_table(PROJ_ID  VARCHAR(5)  PRIMARY KEY,  PROJ_NAME  VARCHAR(25),  DOMAIN VARCHAR(25), START_DATE DATE, CLOSURE_DATE DATE, DEV_QTR VARCHAR(5), STATUS VARCHAR(10));
CREATE TABLE emp_record_table(
	  EMP_ID varchar(5),
      FIRST_NAME varchar(25),
      LAST_NAME varchar(25),
      GENDER char(1),
      ROLE varchar(25),
      DEPT varchar(25),
      EXP int,
      COUNTRY varchar(25),
      CONTINENT varchar(25),
      SALARY float,
      EMP_RATING int,
      MANAGER_ID varchar(5),
      PROJ_ID varchar(5),
      FOREIGN KEY(PROJ_ID) REFERENCES Proj_table(PROJ_ID);
CREATE TABLE emp_record_table(
	  EMP_ID varchar(5),
      FIRST_NAME varchar(25),
      LAST_NAME varchar(25),
      GENDER char(1),
      ROLE varchar(25),
      DEPT varchar(25),
      EXP int,
      COUNTRY varchar(25),
      CONTINENT varchar(25),
      SALARY float,
      EMP_RATING int,
      MANAGER_ID varchar(5),
      PROJ_ID varchar(5),
      FOREIGN KEY(PROJ_ID) REFERENCES Proj_table(PROJ_ID);
CREATE TABLE emp_record_table(
	  EMP_ID varchar(5),
      FIRST_NAME varchar(25),
      LAST_NAME varchar(25),
      GENDER char(1),
      ROLE varchar(25),
      DEPT varchar(25),
      EXP int,
      COUNTRY varchar(25),
      CONTINENT varchar(25),
      SALARY float,
      EMP_RATING int,
      MANAGER_ID varchar(5),
      PROJ_ID varchar(5),
      FOREIGN KEY(PROJ_ID) REFERENCES Proj_table(PROJ_ID);
create table emp_reocrd_table(EMP_ID varchar(5) PRIMARY KEY, FIRST_NAME VARCHAR(25), LAST_NAME_VARCHAR(25), GENDER CHAR(1), ROLE VARCHAR(25), DEPT VARCHAR(25), EXP INT, COUNTRY VARCHAR(25), COUNTINENT VARCHAR(25), SALARY FLOAT, EMP_RATING INT, MANAGER_ID VARCHAR(5), PROJ_ID VARCHAR(5), FOREIGN KEY(PROJ_ID) PREFERENCEC Proj_table(PROJ_ID) );
create table emp_reocrd_table(EMP_ID varchar(5) PRIMARY KEY, FIRST_NAME VARCHAR(25), LAST_NAME_VARCHAR(25), GENDER CHAR(1), ROLE VARCHAR(25), DEPT VARCHAR(25), EXP INT, COUNTRY VARCHAR(25), COUNTINENT VARCHAR(25), SALARY FLOAT, EMP_RATING INT, MANAGER_ID VARCHAR(5), PROJ_ID VARCHAR(5), FOREIGN KEY(PROJ_ID) PREFERENCEC Proj_table(PROJ_ID) );
CREATE TABLE Proj_table(PROJ_ID  VARCHAR(5)  PRIMARY KEY,  PROJ_NAME  VARCHAR(25),  DOMAIN VARCHAR(25), START_DATE DATE, CLOSURE_DATE DATE, DEV_QTR VARCHAR(5), STATUS VARCHAR(10));
CREATE TABLE Proj_table(PROJ_ID  VARCHAR(5)  PRIMARY KEY,  PROJ_NAME  VARCHAR(25),  DOMAIN VARCHAR(25), START_DATE DATE, CLOSURE_DATE DATE, DEV_QTR VARCHAR(5), STATUS VARCHAR(10));
