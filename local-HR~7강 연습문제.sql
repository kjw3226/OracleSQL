-- 07�� ���̺� �����ϱ�

--1. Equi������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ��̸��� ����ϼ���. 

SELECT e.ename, e.dno, d.dname 
FROM employee e, department d 
WHERE e.dno = d.dno 
AND e.ename='SCOTT'; 
 
 
--2. Inner ���ΰ� on�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����ϼ���. 

SELECT e.ename, d.dname, d.loc 
FROM employee e JOIN department d 
ON e.dno = d.dno; 
 
--3. INNER ���� Using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� �������� ���� ����� �μ��� �������� �����Ͽ� ����ϼ���. 

SELECT dno, job, loc 
FROM employee INNER JOIN department 
USING(dno) 
WHERE dno=10; 
 

--4. Natural������ ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����ϼ��� 

SELECT ename, dname, loc 
FROM employee NATURAL JOIN department 
WHERE commission>0; 
 

--5. Equal ���ΰ� Wildī�带 ����ؼ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����ϼ���, 

SELECT e.ename, d.dname 
FROM employee e, department d 
WHERE e.dno=d.dno 
AND e.ename LIKE '%A%'; 
 

--6. Natural ������ ����Ͽ� NEW York�� �ٹ��ϴ� ��� ����� �̸�, ���� �μ���ȣ �� �μ����� ����ϼ���. 

SELECT ename, job,dno, dname 
FROM employee NATURAL JOIN department 
WHERE loc='NEW YORK'; 
 

--7. Self Join�� ����Ͽ� ����� �̸��� ��� ��ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����ϼ���.  
--�� ���� ��Ī�� ����̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#) 

SELECT e.ename AS "Employee", 
        e.manager AS "Emp#", 
        m.ename AS "Manager", 
        m.eno AS "Mgr#" 
    FROM employee e, employee m 
    WHERE e.manager = m.eno; 

