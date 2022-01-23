--6�� ��������

--1. ��� ��ȣ�� 7788�� ����� �������� ���� ����� ǥ��(����̸��� ������)�ϼ���. 

SELECT ename, job FROM employee WHERE job = (SELECT job 
FROM employee WHERE eno=7788); 
 
--2. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ������)�ϼ��� 

SELECT ename, job FROM employee WHERE salary > (SELECT salary 
FROM employee WHERE eno=7499); 
 
--3. �ּ� �޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���ϼ���(�׷��Լ�) 

SELECT ename, job, salary FROM employee WHERE salary = (SELECT MIN(salary) 
FROM employee); 

--4. ��� �޿��� ���� ���� ������ ã�� ���ް� ��� �޿��� ǥ���ϼ��� 

SELECT job,ROUND(AVG(salary),1) FROM employee GROUP BY job 
HAVING ROUND(AVG(salary),1) = (SELECT MIN(ROUND(AVG(salary),1)) 
FROM employee GROUP BY job); 
 
--5. �� �μ��� �ּұ޿��� �޴� ��� �̸�,�޿�, �μ���ȣ��ǥ���ϼ���. 

SELECT ename, salary, dno FROM employee WHERE salary IN(SELECT MIN(salary) 
FROM employee GROUP BY dno); 

--6. �������� �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м���(ANALYST)�ƴ� ���(�����ȣ, �̸�, ������,�޿�)���� ǥ���ϼ���. 

SELECT eno, ename, job, salary FROM employee WHERE salary < ANY(SELECT salary 
FROM employee WHERE job='ANALYST') AND job<>'ANALYST'; 

--7. �Ŵ��� ���� ����� �̸��� ǥ���ϼ���. 

SELECT ename FROM employee WHERE eno IN(SELECT eno FROM employee 
WHERE manager IS NULL); 
 
--8. �Ŵ��� �ִ� ����� �̸��� ǥ���ϼ���. 

SELECT ename FROM employee WHERE eno IN(SELECT eno FROM employee 
WHERE manager IS NOT NULL); 
 
--9. BLAKE�� ������ �μ��� ���� ����� �̸���  �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���.(�� BLAKE�� ����) 

SELECT ename, hiredate FROM employee WHERE dno = (SELECT dno FROM employee WHERE ename='BLAKE') 
AND ename<>'BLAKE'; 

--10. �޿��� ��պ��� ���� ������� �����ȣ�� �̸��� ǥ���ϵ�  ����� �޿��� ���� ������������ �����ϼ���., 

SELECT eno, ename FROM employee WHERE salary > (SELECT AVG(salary) FROM employee) 
ORDER BY salary ASC; 
 
--11. �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���. 

SELECT eno,ename FROM employee WHERE dno IN(SELECT dno FROM employee 
WHERE ename LIKE '%K%'); 
 
--12. �μ���ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� �������� ǥ���ϼ���. 

SELECT ename,dno, job FROM employee WHERE dno=(SELECT dno 
FROM department WHERE loc='DALLAS'); 

--13. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���ϼ��� 

SELECT ename, salary FROM employee WHERE manager = (SELECT eno FROM employee 
WHERE ename='KING'); 
 
--14. RESEARCH �μ��� ����� ���� �μ���ȣ, �����ȣ �� �������� ����ϼ��� 

SELECT dno,ename, job FROM employee WHERE dno = (SELECT dno FROM department 
WHERE dname='RESEARCH'); 
 
--15. ��� �޿����� ���� �޿��� �ް� �̸����� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ����ϼ���. 

SELECT eno,ename, salary FROM employee WHERE salary > (SELECT AVG(salary) FROM employee) 
AND dno IN(SELECT dno FROM employee WHERE ename LIKE '%M%'); 
 
--16. ��ձ޿��� ���� ���� ������ ã������ 

SELECT job, AVG(salary) FROM employee GROUP BY job HAVING AVG(salary) = (SELECT MIN(AVG(salary)) 
FROM employee GROUP BY job); 
 
-- 17. ���������� ���� ����� �����ȣ�� �̸��� ����ϼ���. 

SELECT ename FROM employee WHERE eno IN(SELECT manager 
FROM employee); 

