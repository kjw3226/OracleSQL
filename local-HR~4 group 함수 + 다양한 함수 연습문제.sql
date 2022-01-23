--4�� ��������----
--1 ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����ϼ���. 
--  ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����ϼ���. 
--  Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ� ��տ� ���ؼ��� ������ �ݿø� �ϼ���.

SELECT   MAX(salary) as "Maximum", MIN(salary) as  "Minimum",SUM(salary) as "Sum", 
Round(AVG(salary)) as "Average" FROM  employee;

--2�� ������ �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����ϼ���. 
--Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ� ��տ� ���ؼ��� ������ �ݿø� �ϼ���.

select job as "JOB",MAX(salary) as "Maximum",MIN(salary) as "Minimum",SUM(salary)as "Sum", 
ROUND(AVG(salary)) as "Average"  from employee GROUP BY job;

--3 Count(*)�Լ��� �̿��ؼ� �������� ������ ����� ���� ����ϼ���

SELECT job,COUNT(*) FROM employee GROUP BY job;

--4 �������� ���� �����ϼ���. Į���� ��Ī�� COUNT(MANAGER)�� ����ϼ���.
 
select count(DISTINCT manager) as manager from employee;
select count(*) from employee where job like '%manager'

--5 �޿� �ְ��, �޿� �������� ������ ����ϼ���. Į���� ��Ī DIFFERENCE�� �����ϼ���

select  MAX(salary) - MIN(salary) as "DIFFERENCE" FROM  employee;

--6 ���޺� ����� ���� �޿��� ����ϼ���. 
--�����ڸ� �� �� ���� ��� �� ���� �޿��� 2000�̸��� �׷��� ���ܽ�Ű�� �޿��� ���� ������������ �����Ͽ� ����ϼ���.

select job, min(salary) from employee where manager is not null group by job having min(salary)>2000
order by min(salary) desc;

--7 �� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�.
-- Į���� ��Ī�� �μ���ȣ(DNO), �����(Number of PeoPle), ��ձ޿�(Salary)�� �����ϰ� ��ձ޿��� �Ҽ��� 2° �ڸ����� �ݿø� �ϼ���.

select dno, count(*) as "number of people", round(avg(salary),2) as "salary"from employee group by dno ORDER BY dno asc;

--�پ��� �Լ� ��������
--1
--substr�� ������� �Ի�⵵�� �Ի���� ����Ͻÿ�.

SELECT SUBSTR(hiredate ,1,2) AS �⵵,SUBSTR(hiredate ,4,2) AS �� FROM employee 

--2
--SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����ϼ���.

SELECT * FROM employee WHERE SUBSTR(hiredate,4,2)='04'; 

--3
--MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����ϼ��� 

SELECT * FROM employee WHERE MOD(eno,2) =0; 

--4
--�Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� �����Ͽ� ����ϼ���. 

SELECT hiredate, TO_CHAR(hiredate,'YY/MM/DD  DY') FROM employee; 

--5
--������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL ��ſ� 0�� ����ϼ���. 

SELECT eno, ename, NVL2(manager, manager,0) AS  "�����ȣ" FROM employee;

--6
--DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �ϼ���. 
--������ 'ANAIYST'�� ����� 200, 'SALESMAN'�� ����� 180, 'MANAGER'�� ����� 150,'CLERK'�� ����� 100�� �λ��ϼ���. 

SELECT eno,ename,job,salary,DECODE (job,'ANAIYST',salary+200,'SALESMAN',salary+180,'MANAGER',salary+150, 
'CLERK',salary+100, salary) AS "�λ�� �޿�" FROM employee;
