--8�� �������� 
  (���Ἲ,��������)
--1.EMP ���̺��� ������ �����Ͽ� EMP_INSERT�� �� ���̺��� ���弼��.

CREATE table emp_insert as SELECT * from employee where 0=1;

select*from emp_insert;

--2. ������ EMP_INSERT���̺� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ���
--insert into emp_insert (eno,ename,hiredate) 
--VALUES(3226,'�����',sysdate);

insert into emp_insert values(1,'�����','student',null,sysdate,3000,300,30);

select*from emp_insert;

--3. EMP_INSERT ���̺� ������� �߰��ϵ� TO_DATE�Լ��� ����ؼ� �Ի����� ������ �Է��ϼ���.
--insert into emp_insert (eno,ename,hiredate) VALUES(3227,'������',to_date('2021-09-30'));

insert into emp_insert values(2,'������','teacher',null,TO_DATE(sysdate-1,'YYYY/MM/DD'),2500,500,20)

select*from emp_insert;

commit;

--4. Employee���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ���弼��.
--CREATE table emp_copy as SELECT * from employee where 1=1;

CREATE table emp_copy as SELECT*from employee;

select*from emp_copy;

--5. �����ȣ�� 7788�� ����� �μ���ȣ�� 10���� �����ϼ���. 

update employee set dno=10 where eno=7788;

select*from employee;

--6. �����ȣ�� 7788�� ������ �� �޿��� �����ȣ 7499�� ��� ������ �޿��� ��ġ�ϵ��� �����ϼ���.

update emp_copy set (job,salary) = (select job,salary from emp_copy where eno=7499)
where eno = 7788;

select*from emp_copy;

--7. �����ȣ 7369�� ������ ������ ��� ����� �μ���ȣ�� ��� 7369�� ���� �μ���ȣ�� �����ϼ���.

UPDATE emp_copy SET dno=(SELECT dno FROM emp_copy WHERE eno=7369) 
WHERE job=(SELECT job FROM emp_copy WHERE eno=7369);
select*from emp_copy;

commit;

--8. Department ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺��� ���弼��.

CREATE table dept_copy where dname = 'RESEARCH';
select*from dept_copy;

commit;


--9. DEPT_COPY���̺��� �μ����� RESEARCH�� �μ��� �����ϼ���.

delete from dept_copy where dname='RESEARCH';
select *from dept_copy;


--10. DEPT_COPY���̺��� �μ���ȣ����� 10�̰ų� 40�� �μ��� �����ϼ���. 

delete from dept_copy where dno in (10,40);
select*from dept_copy;