-- 05�� �׷� �Լ� ��������

--1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����ϼ���.  
-- ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����ϼ���.  
-- Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ�  
-- ��տ� ���ؼ��� ������ �ݿø� �ϼ���. 

SELECT MAX(salary) AS "MAXimum", MIN(salary) AS "Minimun", SUM(salary) AS "Sum", ROUND(AVG(salary)) AS "Average" 
FROM employee; 

--2. �� ������ �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����ϼ���.  
-- Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ�  
-- ��տ� ���ؼ��� ������ �ݿø� �ϼ���. 

SELECT job AS "JOB", MAX(salary) AS "MAXimum", MIN(salary) AS "Minimun", SUM(salary) AS "Sum", ROUND(AVG(salary)) AS "Average" 
FROM employee GROUP BY job; 

--3. Count(*)�Լ��� �̿��ؼ� �������� ������ ����� ���� ����ϼ��� 

SELECT job, count(*) FROM employee GROUP BY job; 

--4. �������� ���� �����ϼ���. Į���� ��Ī�� MANAGER�� ����ϼ���. 

SELECT count(DISTINCT(manager)) as manager  FROM employee; 

--5. �޿� �ְ��, �޿� �������� ������ ����ϼ���. Į���� ��Ī DIFFERENCE�� �����ϼ��� 

SELECT MAX(salary)-MIN(salary) AS "DIFFERENCE" 
FROM employee; 

--6. ���޺� ����� ���� �޿��� ����ϼ���.  
-- �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000�̸��� �׷��� ���ܽ�Ű��  
-- ��� �޿��� ���� ������������ �����Ͽ� ����ϼ���. 

SELECT job,MIN(salary)FROM employee WHERE manager is not null GROUP BY job
HAVING NOT MIN(salary)<2000 ORDER BY AVG(salary) DESC;
 

--7. �� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�,  
-- Į���� ��Ī�� �μ���ȣ(DNO), �����(Number of PeoPle), ��ձ޿�(Salary)�� �����ϰ�  
-- ��ձ޿��� �Ҽ��� 2° �ڸ����� �ݿø� �ϼ���. 

SELECT dno, COUNT(*) AS "NUMBER OF PEOPLE", ROUND(AVG(salary),2) AS "Salary" FROM employee 
GROUP BY dno ORDER BY dno ASC; 
 

--8. �� �μ��� ���� �μ���ȣ �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�. 
-- Į���� ��Ī�� �μ���ȣ�̸�(DName), ������(Location), �����(Number of PeoPle), ��ձ޿�(Salary)�� �����ϰ�  
-- ��ձ޿��� ������ �ݿø��ϼ���. 

SELECT DECODE(dno, 10,'ACCOUNTING', 
                    20,'RESEARCH', 
                    30,'SALES', 
                    40,'OPERATIONS') AS "DName", 
        DECODE(dno, 10,'NEW YORK', 
                    20,'DALLAS', 
                    30,'CHICAGO', 
                    40,'BOSTON') AS "Location", 
        COUNT(*) AS "Number of People", 
        ROUND(avg(salary)) AS "Salary" 
FROM employee 
GROUP BY dno; 

--  9.������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �޿� �� �μ� 10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�.  
-- �� Į���� ��Ī�� ���� job, �μ�10,�μ�20, �μ�30, �Ѿ����� �����ϼ���. 

SELECT job,dno,
        DECODE(dno,10, SUM(salary)) AS "�μ� 10",
        DECODE(dno,20, SUM(salary)) AS "�μ� 20",
        DECODE(dno,30, SUM(salary)) AS "�μ� 30",
        SUM(salary) AS "�Ѿ�"
FROM employee
GROUP BY dno, ROLLUP(JOB)
ORDER BY dno;