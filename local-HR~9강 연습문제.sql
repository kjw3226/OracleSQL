-- 09�� ���̺� ���� ��������

--1. ���� ǥ�� ��õ� ��� DEPT ���̺��� �����ϼ��� 

DROP TABLE dept; 
CREATE TABLE dept( 
    dno NUMBER(2), 
    dname VARCHAR2(14), 
    loc VARCHAR2(13)); 
 
--2. ���� ǥ�� ��õ� ��� EMP ���̺��� �����ϼ���. 

DROP TABLE emp; 
CREATE TABLE emp( 
    ENO NUMBER(4), 
    ENAME VARCHAR2(10), 
    DNO NUMBER(2)); 


--3. �� �̸��� ������ �� �ֵ��� EMP���̺��� �����ϼ���.(ENAMEĮ��) 
ALTER TABLE emp 
MODIFY ename VARCHAR2(25); 
 
 

--4. EMPLOYEE���̺��� �����ؼ� EMPLOYEE2�� �̸��� ���̺��� �����ϵ� �����ȣ, �̸�, �޿�, �μ���ȣ Į���� �����ϰ�  
--���� ������ Į������ ���� EMP_ID, NAME, SAL, DEPT_ID�� �����ϼ���, 

CREATE TABLE employee2(emp_id,name, sal, dept_id) 
AS 
SELECT eno,ename,salary, dno FROM employee; 
 
 
--5. EMP ���̺��� �����ϼ��� 

DROP TABLE emp; 

 

--6. EMPLOYEE2���̺��� �̸��� EMP�� �����ϼ��� 

RENAME employee2 to EMP; 

--7. DEPT ���̺��� DNAME Į���� �����ϼ��� 

ALTER TABLE dept 
DROP COLUMN dname; 




