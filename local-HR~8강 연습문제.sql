--8강 연습문제 
  (무결성,제약조건)
--1.EMP 테이블의 구조만 복사하여 EMP_INSERT란 빈 테이블을 만드세요.

CREATE table emp_insert as SELECT * from employee where 0=1;

select*from emp_insert;

--2. 본인을 EMP_INSERT테이블에 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하세요
--insert into emp_insert (eno,ename,hiredate) 
--VALUES(3226,'김재원',sysdate);

insert into emp_insert values(1,'김재원','student',null,sysdate,3000,300,30);

select*from emp_insert;

--3. EMP_INSERT 테이블에 옆사람을 추가하되 TO_DATE함수를 사용해서 입사일을 어제로 입력하세요.
--insert into emp_insert (eno,ename,hiredate) VALUES(3227,'김유진',to_date('2021-09-30'));

insert into emp_insert values(2,'김유진','teacher',null,TO_DATE(sysdate-1,'YYYY/MM/DD'),2500,500,20)

select*from emp_insert;

commit;

--4. Employee테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드세요.
--CREATE table emp_copy as SELECT * from employee where 1=1;

CREATE table emp_copy as SELECT*from employee;

select*from emp_copy;

--5. 사원번호가 7788인 사원의 부서번호를 10으로 수정하세요. 

update employee set dno=10 where eno=7788;

select*from employee;

--6. 사원번호가 7788의 담당업무 및 급여를 사원번호 7499의 담당 업무및 급여와 일치하도록 갱신하세요.

update emp_copy set (job,salary) = (select job,salary from emp_copy where eno=7499)
where eno = 7788;

select*from emp_copy;

--7. 사원번호 7369와 업무가 동일한 모든 사원의 부서번호를 사원 7369의 현재 부서번호를 갱신하세요.

UPDATE emp_copy SET dno=(SELECT dno FROM emp_copy WHERE eno=7369) 
WHERE job=(SELECT job FROM emp_copy WHERE eno=7369);
select*from emp_copy;

commit;

--8. Department 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드세요.

CREATE table dept_copy where dname = 'RESEARCH';
select*from dept_copy;

commit;


--9. DEPT_COPY테이블에서 부서명이 RESEARCH인 부서를 제거하세요.

delete from dept_copy where dname='RESEARCH';
select *from dept_copy;


--10. DEPT_COPY테이블에서 부서번호우ㅐ가 10이거나 40인 부서를 제거하세요. 

delete from dept_copy where dno in (10,40);
select*from dept_copy;