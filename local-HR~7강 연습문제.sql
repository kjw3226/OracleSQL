-- 07강 테이블 조인하기

--1. Equi조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하세요. 

SELECT e.ename, e.dno, d.dname 
FROM employee e, department d 
WHERE e.dno = d.dno 
AND e.ename='SCOTT'; 
 
 
--2. Inner 조인과 on연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하세요. 

SELECT e.ename, d.dname, d.loc 
FROM employee e JOIN department d 
ON e.dno = d.dno; 
 
--3. INNER 조인 Using 연산자를 사용하여 10번 부서에 속하는 모든 담당업무의 고유 목록을 부서의 지역명을 포함하여 출력하세요. 

SELECT dno, job, loc 
FROM employee INNER JOIN department 
USING(dno) 
WHERE dno=10; 
 

--4. Natural조인을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하세요 

SELECT ename, dname, loc 
FROM employee NATURAL JOIN department 
WHERE commission>0; 
 

--5. Equal 조인과 Wild카드를 사용해서 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하세요, 

SELECT e.ename, d.dname 
FROM employee e, department d 
WHERE e.dno=d.dno 
AND e.ename LIKE '%A%'; 
 

--6. Natural 조인을 사용하여 NEW York에 근무하는 모든 사원의 이름, 업무 부서번호 및 부서명을 출력하세요. 

SELECT ename, job,dno, dname 
FROM employee NATURAL JOIN department 
WHERE loc='NEW YORK'; 
 

--7. Self Join을 사용하여 사원의 이름및 사원 번호를 관리자 이름 및 관리자 번호와 함께 출력하세요.  
--각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#) 

SELECT e.ename AS "Employee", 
        e.manager AS "Emp#", 
        m.ename AS "Manager", 
        m.eno AS "Mgr#" 
    FROM employee e, employee m 
    WHERE e.manager = m.eno; 

