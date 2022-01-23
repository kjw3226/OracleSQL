
--10강 데이터 무결성과 제약조건 연습문제

--1. Employee테이블의 구조를 복사하여 EMP_SAMPLE란 이름의 테이블을 만드세요  
--사원테이블의 사원 번호칼럼에 테이블 레벨로 primary key 제약조건을 지정하되 제약조건이름은 my_emp_pk로 지정하세요. 

CREATE table emp_sample as select*from employee where 0=1;
ALTER TABLE emp_sample 
ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno); 
select*from emp_sample;

--2. 부서 테이블의 부서번호 칼럼에 테이블 레벨로 primary key 제약조건을 
     지정하되 제약조건 이름은 my_dept_pk로 지정하세요. 

CREATE table dept_sample as select*from employee where 1=0;
select*from dept_sample;
ALTER TABLE dept_sample 
ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno); 

--3. 사원테이블의 부서번호 칼럼에 존재하지 않는 부서의 사원이 배정되지 않도록 외래키 제약조건을 지정하되 
      제약조건이름은 my_emp_dept_fk 로 지정하세요. 

ALTER TABLE emp_sample 
ADD CONSTRAINT my_emp_dept_fk 
FOREIGN KEY(dno) REFERENCES dept_sample(dno); 

--4. 사원테이블의 커미션 컬럼에 0보다 큰 값만을 입력할 수 있도록 제약조건을 지정하세요.

ALTER TABLE emp_sample 
ADD CONSTRAINT emp_commission_min CHECK(commission>0); 
