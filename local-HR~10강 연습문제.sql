
--10�� ������ ���Ἲ�� �������� ��������

--1. Employee���̺��� ������ �����Ͽ� EMP_SAMPLE�� �̸��� ���̺��� ���弼��  
--������̺��� ��� ��ȣĮ���� ���̺� ������ primary key ���������� �����ϵ� ���������̸��� my_emp_pk�� �����ϼ���. 

CREATE table emp_sample as select*from employee where 0=1;
ALTER TABLE emp_sample 
ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno); 
select*from emp_sample;

--2. �μ� ���̺��� �μ���ȣ Į���� ���̺� ������ primary key ���������� 
     �����ϵ� �������� �̸��� my_dept_pk�� �����ϼ���. 

CREATE table dept_sample as select*from employee where 1=0;
select*from dept_sample;
ALTER TABLE dept_sample 
ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno); 

--3. ������̺��� �μ���ȣ Į���� �������� �ʴ� �μ��� ����� �������� �ʵ��� �ܷ�Ű ���������� �����ϵ� 
      ���������̸��� my_emp_dept_fk �� �����ϼ���. 

ALTER TABLE emp_sample 
ADD CONSTRAINT my_emp_dept_fk 
FOREIGN KEY(dno) REFERENCES dept_sample(dno); 

--4. ������̺��� Ŀ�̼� �÷��� 0���� ū ������ �Է��� �� �ֵ��� ���������� �����ϼ���.

ALTER TABLE emp_sample 
ADD CONSTRAINT emp_commission_min CHECK(commission>0); 
