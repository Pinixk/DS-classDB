-- 1(O)
select eno 사원번호, ename 사원명, salary 현재급여, nvl(commission,0)+300 인상급여 from employee;

-- 2(O)
select ename 사원명, salary 급여명, salary*12 "연간 총수입" from employee order by salary desc;
select ename 사원명, salary 급여명, salary*12 "연간 총수입" from employee order by "연간 총수입" desc;

-- 3(O)
select ename, salary from employee where salary >= 2000 order by salary desc;

-- 4(O)
select ename, dno from employee where eno = 7788;
select ename, dno from employee where eno = '7788';

-- 5(order by 선택)(O)
select ename, dno, salary from employee where not salary between 2000 and 3000 order by salary;

-- 6(X)(이상, 이하로 가야함)
select * from employee where hiredate >= '81/02/20' and hiredate <= '81/05/01';
select * from employee where hiredate between '81/02/20' and '81/05/01';

-- 7(0)
select ename, dno from employee where dno=20 or dno=30 order by ename desc;
select ename, dno from employee where dno in(20, 30) order by ename desc;

-- 8(O)
select ename, salary, dno from employee 
where salary between 2000 and 3000 
and not dno=10 
order by ename;

select ename 이름, salary 급여, dno 부서번호 from employee 
where salary between 2000 and 3000 
and dno in (20,30)
order by ename;

-- 9(O)
select ename, hiredate from employee where to_char(hiredate,'yy')= 81;
select ename, hiredate from employee where hiredate like '81%';

-- 10(X)(d.name과 job을 헷갈려서 틀림)
select ename, job from employee e, department d where e.manager is null and d.dno=e.dno;

-- 11(X)(order by desc 둘 다 줘야함)
select ename, salary, commission from employee 
where commission is not null 
order by salary, commission desc;

select ename, salary, commission from employee 
where commission is not null 
order by salary desc, commission desc;

-- 12(O)
select ename from employee where ename like '__R%';

-- 13(X)
select ename from employee where ename like '%A%E%';
select ename from employee where ename like '%E%A%';  -- A와 E를 같이 포함 하는것이 아님, A->E만 지칭
select ename from employee where ename like '%E%' and ename like '%A%';

-- 14(O)
select ename, job, salary from employee
where job in('CLERK','SALESMAN')
and salary not in(950,1300,1600);

--15(O)
select ename, salary, commission from employee where commission >= 500;
