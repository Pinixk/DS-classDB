-- 1. 덧셈 연산자를 이용하여 모든 사원에 대해 급여를 $300의 인상 (O)
select eno 사원번호, ename 사원명, salary 현재급여, nvl(commission,0)+300 인상급여 from employee;

-- 2. 연간 총 수입이 많은 순으로 출력 (O)
select ename 사원명, salary 급여명, salary*12 "연간 총수입" from employee order by salary desc;
select ename 사원명, salary 급여명, salary*12 "연간 총수입" from employee order by "연간 총수입" desc;

-- 3. 급여가 2000이 넘는 사원을 내림차순으로 출력 (O)
select ename, salary from employee where salary >= 2000 order by salary desc;

-- 4. 사원번호가 7788인 사원의 부서번호 출력 (O)
select ename, dno from employee where eno = 7788;
select ename, dno from employee where eno = '7788';

-- 5. 급여가 2000에서 3000 사이에 포함되지 않는 사람 출력 (order by 선택)(O)
select ename, dno, salary from employee where not salary between 2000 and 3000 order by salary;

-- 6. 입사일이 1981년 2월 20일부터 81년 5월 1일 사이인 사람 출력 (X)(이상, 이하로 가야함)
select * from employee where hiredate >= '81/02/20' and hiredate <= '81/05/01';
select * from employee where hiredate between '81/02/20' and '81/05/01';

-- 7. 부서번호가 20, 30인 사람을 영문자의 내림차순으로 출력 (0)
select ename, dno from employee where dno=20 or dno=30 order by ename desc;
select ename, dno from employee where dno in(20, 30) order by ename desc;

-- 8. 사원 급여가 2000에서 3000사이이며 부서번호가 20이나 30인 사람의 이름순으로 출력 (O)
select ename, salary, dno from employee 
where salary between 2000 and 3000 
and not dno=10 
order by ename;

select ename 이름, salary 급여, dno 부서번호 from employee 
where salary between 2000 and 3000 
and dno in (20,30)
order by ename;

-- 9. 1981년도에 입사한 사원의 이름과 입사일 출력 (O)
select ename, hiredate from employee where to_char(hiredate,'yy')= 81;
select ename, hiredate from employee where hiredate like '81%';

-- 10.  관리자가 없는 사원의 이름과 담담 업무 출력 (X)(d.name과 job을 헷갈려서 틀림)
select ename, job from employee e, department d where e.manager is null and d.dno=e.dno;

-- 11. 커미션을 받을 수 있는 사람을 급여 및 커미션 기준으로 내림차순 (X)(order by desc 둘 다 줘야함)
select ename, salary, commission from employee 
where commission is not null 
order by salary, commission desc;

select ename, salary, commission from employee 
where commission is not null 
order by salary desc, commission desc;

-- 12. 이름의 세번째 문자가 R인 사람 출력 (O)
select ename from employee where ename like '__R%';

-- 13. 이름에 A와 E를 모두 포함한 사람 출력 (X)
select ename from employee where ename like '%A%E%';
select ename from employee where ename like '%E%A%';  -- A와 E를 같이 포함 하는것이 아님, A->E만 지칭
select ename from employee where ename like '%E%' and ename like '%A%';

-- 14. 담당업무가 사무원 또는 영업사원이면서 급여가 $950, $1300, $1600이 아닌 사람 (O)
select ename, job, salary from employee
where job in('CLERK','SALESMAN')
and salary not in(950,1300,1600);

--15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션 출력 (O)
select ename, salary, commission from employee where commission >= 500;
