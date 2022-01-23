
<Oracle Data Base SQL ������ ��ȸ�ϱ�>

--1. ���������� �̿��Ͽ� ��� ����� ���Ͽ� $300�� �޿� �λ��� ����� �� ����� �̸�,�޿�, �λ�� �޿��� ����ϼ���. 

SELECT ename, salary, salary+300 FROM employee; 
 
--2. ����� �̸�, �޿�, ���� �Ѽ����� �Ѽ����� ���� �� ���� ���� ������ ����ϼ���. ���� �Ѽ����� ���޿� *12�� �� �� $100�� �󿩱��� ���ؼ� ����ϼ���. 

SELECT ename, salary, salary*12+100 FROM employee ORDER BY salary*12+100 DESC; 
 
--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ����ϼ���. 

SELECT ename, salary FROM employee WHERE salary > 2000 ORDER BY salary DESC; 
 
--4. ��� ��ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���

SELECT ename, dno FROM employee WHERE eno=7788; 
 
--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����ϼ��� 

SELECT ename, salary FROM employee where salary NOT BETWEEN 2000 AND 3000; 
 
--6. 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����ϼ���. 

SELECT ename, job, hiredate FROM employee WHERE hiredate BETWEEN '81/02/20' AND '81/05/01'; 
 
--7. �μ� ��ȣ�� 20 �� 30�� ���ϴ� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ������������ ������ ������ ����ϼ���. 

SELECT ename, dno FROM employee WHERE dno in(20,30) ORDER BY ename; 
 
--8. ��� �޿���2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸��� �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ��� 

SELECT ename, salary, dno FROM employee WHERE salary BETWEEN 2000 AND 3000 AND dno IN(20,30) ORDER BY ename; 
 
--9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����ϼ���(LIke�����ڿ� ���ϵ�ī�� ���) 

SELECT ename, hiredate FROM employee WHERE hiredate LIKE '81%'; 
 
--10. �����ڰ� ���� ����� �̸��� �������� ����ϼ��� 

SELECT ename, job FROM employee WHERE manager IS NULL; 
 
--11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� ������������ �����Ͽ� ����ϼ��� 

SELECT ename, salary, commission FROM employee WHERE commission IS NOT NULL ORDER BY salary, commission; 
 
--12. �̸��� ����° ���ڰ� R�� ����� ����ϼ���. 

SELECT ename FROM employee WHERE ename LIKE '__R%'; 
 
--13. �̸��� A�� E�� ��� �����ϴ� ����� �̸��� ����ϼ���. 

SELECT ename FROM employee WHERE ename LIKE '%A%' AND ename LIKE '%E%'; 
 
--14. �������� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸� ������, �޿��� ����ϼ��� 

SELECT ename, job, salary FROM employee WHERE job IN('CLERK','SALESMAN') AND SALARY NOT IN (1600, 950, 1300); 
 
-- 15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����ϼ���. 

SELECT ename, salary, commission FROM employee WHERE commission >=500; 
