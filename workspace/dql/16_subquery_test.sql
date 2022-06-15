-- 1(???)
select dno, eno, ename, salary from
(select dno, round(avg(salary)) from employee group by dno);

-- 2
select ename, job from employee where job in
(select job from employee where eno=7788);

-- 3
select ename, job from employee where salary >
(select salary from employee where eno=7499);

-- 4(???)
select eno, ename, salary, dno from employee where salary in 
(select min(salary) from employee group by dno);

select (select round(avg(salary)) from employee group by job) from employee;


-- 5
select ename, salary, dno from employee where salary in
(select min(salary) from employee group by dno);

-- 6
select eno, job, salary from employee where salary < 
(select salary from employee where job='ANALYST');

-- 7
select ename from employee where eno = (;

-- 8

-- 9
select ename, hiredate from employee where dno in
(select dno from employee where ename='BLAKE') and ename <> 'BLAKE';

- 10
select ename, e.dno, job from employee e, department d where e.dno=d.dno and d.loc=10; in (select loc from loc where cityname='BUSAN');