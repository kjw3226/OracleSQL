-- 09강 테이블 제어 연습문제

--1. 다음 표에 명시된 대로 DEPT 테이블을 생성하세요 

DROP TABLE dept; 
CREATE TABLE dept( 
    dno NUMBER(2), 
    dname VARCHAR2(14), 
    loc VARCHAR2(13)); 
 
--2. 다음 표에 명시된 대로 EMP 테이블을 생성하세요. 

DROP TABLE emp; 
CREATE TABLE emp( 
    ENO NUMBER(4), 
    ENAME VARCHAR2(10), 
    DNO NUMBER(2)); 


--3. 긴 이름을 저장할 수 있도록 EMP테이블을 수정하세요.(ENAME칼럼) 
ALTER TABLE emp 
MODIFY ename VARCHAR2(25); 
 
 

--4. EMPLOYEE테이블을 복사해서 EMPLOYEE2란 이름의 테이블을 생성하되 사원번호, 이름, 급여, 부서번호 칼럼만 복사하고  
--새로 생성된 칼럼명을 각각 EMP_ID, NAME, SAL, DEPT_ID로 지정하세요, 

CREATE TABLE employee2(emp_id,name, sal, dept_id) 
AS 
SELECT eno,ename,salary, dno FROM employee; 
 
 
--5. EMP 테이블을 삭제하세요 

DROP TABLE emp; 

 

--6. EMPLOYEE2테이블의 이름을 EMP로 변경하세요 

RENAME employee2 to EMP; 

--7. DEPT 테이블에서 DNAME 칼럼을 제거하세요 

ALTER TABLE dept 
DROP COLUMN dname; 




