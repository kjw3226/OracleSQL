--4강 연습문제----
--1 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하세요. 
--  사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하세요. 
--  칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고 평균에 대해서는 정수로 반올림 하세요.

SELECT   MAX(salary) as "Maximum", MIN(salary) as  "Minimum",SUM(salary) as "Sum", 
Round(AVG(salary)) as "Average" FROM  employee;

--2각 담당업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하세요. 
--칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고 평균에 대해서는 정수로 반올림 하세요.

select job as "JOB",MAX(salary) as "Maximum",MIN(salary) as "Minimum",SUM(salary)as "Sum", 
ROUND(AVG(salary)) as "Average"  from employee GROUP BY job;

--3 Count(*)함수를 이용해서 담당업무가 동일한 사원의 수를 출력하세요

SELECT job,COUNT(*) FROM employee GROUP BY job;

--4 관리자의 수를 나열하세요. 칼럼의 별칭은 COUNT(MANAGER)로 출력하세요.
 
select count(DISTINCT manager) as manager from employee;
select count(*) from employee where job like '%manager'

--5 급여 최고액, 급여 최저액의 차액을 출력하세요. 칼럼의 별칭 DIFFERENCE로 지정하세요

select  MAX(salary) - MIN(salary) as "DIFFERENCE" FROM  employee;

--6 직급별 사원의 최저 급여를 출력하세요. 
--관리자를 알 수 없는 사원 및 최저 급여가 2000미만인 그룹은 제외시키고 급여에 대한 내림차순으로 정렬하여 출력하세요.

select job, min(salary) from employee where manager is not null group by job having min(salary)>2000
order by min(salary) desc;

--7 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오.
-- 칼럼의 별칭은 부서번호(DNO), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고 평균급여는 소수점 2째 자리에서 반올림 하세요.

select dno, count(*) as "number of people", round(avg(salary),2) as "salary"from employee group by dno ORDER BY dno asc;

--다양한 함수 연습문제
--1
--substr로 사원들의 입사년도와 입사월을 출력하시오.

SELECT SUBSTR(hiredate ,1,2) AS 년도,SUBSTR(hiredate ,4,2) AS 달 FROM employee 

--2
--SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하세요.

SELECT * FROM employee WHERE SUBSTR(hiredate,4,2)='04'; 

--3
--MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하세요 

SELECT * FROM employee WHERE MOD(eno,2) =0; 

--4
--입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 지정하여 출력하세요. 

SELECT hiredate, TO_CHAR(hiredate,'YY/MM/DD  DY') FROM employee; 

--5
--사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 대신에 0을 출력하세요. 

SELECT eno, ename, NVL2(manager, manager,0) AS  "상관번호" FROM employee;

--6
--DECODE 함수로 직급에 따라 급여를 인상하도록 하세요. 
--직급이 'ANAIYST'인 사원은 200, 'SALESMAN'인 사원은 180, 'MANAGER'인 사원은 150,'CLERK'인 사원은 100을 인상하세요. 

SELECT eno,ename,job,salary,DECODE (job,'ANAIYST',salary+200,'SALESMAN',salary+180,'MANAGER',salary+150, 
'CLERK',salary+100, salary) AS "인상된 급여" FROM employee;
