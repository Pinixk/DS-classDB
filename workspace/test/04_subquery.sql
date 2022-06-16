-- 1. 각 부서 평균 급여에 대해 +-500 사이에 있는 사원 찾기
select a.dno, e.eno, e.ename, e.salary from employee e,
(select dno, round(avg(salary))평균급여 from employee group by dno) a
where e.dno = a.dno and salary between a.평균급여-500 and a.평균급여+500;

-- 2. 사원번호 7788인 사원과 담당 업무가 같은 사원 표시
select ename, job from employee where job in
(select job from employee where eno=7788);

-- 3. 사원번호 7499인 사원보다 급여가 많은 사원 표시
select ename, job from employee where salary >
(select salary from employee where eno=7499);

-- 4. job 별로 평균 급여가 가장 적은 job의 평균 급여 표시
select job, round(avg(salary)) from employee group by job 
having round(avg(salary)) = (select min(round(avg(salary))) from employee group by job);

-- 5. 각 부서 최소 급여 받는 사람 표시
select ename, salary, dno from employee where salary in
(select min(salary) from employee group by dno) order by dno;

-- 6. ANALYST보다 급여가 적으면서 업무가 ANALYSY가 아닌 사원 표시
select eno, job, salary from employee 
where salary < all (select salary from employee where job='ANALYST');
and job <> 'ANALYST';

-- 7. 부하직원이 없는 사원 이름 표시
select * from employee where eno not in (select distinct manager from employee where manager is not null);

-- 8. 부하직원이 있는 사원 이름 표시
select * from employee where eno in (select distinct manager from employee where manager is not null);

-- 9. BLAKE와 같은 부서에 속한 사원 찾기
select ename, hiredate from employee where dno in
(select dno from employee where ename='BLAKE') and ename <> 'BLAKE';

-- 10. 부서 위치가 BUSAN인 사원 표시
select ename, e.dno, job from employee e, department d where e.dno=d.dno and d.loc=10; in (select loc from loc where cityname='BUSAN');

-- 11. KING에게 보고하는 사원 표시

-- 12. 평균보다 많은 급여를 받고 이름에 M이 들어가는 사원과 같은 부서에 근무하는 사원 표시

-- 13. 담당업무가 ANALYST인 사원과 같은 부서의 사원 표시

-- 14. 부서번호, 부서명, 부서별 인원수를 출력

-- 15. 각 근무 지역에 대해 근무지역명, 지역번호, 지역별 사원수, 지역별 평균 급여 출력