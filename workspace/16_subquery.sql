-- 선택자
select eno, ename, dno, (select dname from department where dno = e.dno)부서명 from employee e;

select eno, ename, manager, (select m.ename from employee e, employee m where e.manager=m.eno) from employee; -- error
select eno, ename, manager, (select ename from employee where eno= e.manager) from employee e;

-- 테이블
select rownum, A.* from (select eno, ename, salary from employee order by salary desc) A;

select * from
(select rownum r, A.* from (select eno, ename, salary from employee order by salary desc) A)
where r between 6 and 10;

-- 조건절
select ename, dno, salary from employee where (select min(salary) from employee where dno=10) > salary;

select eno, ename, dno, salary from employee where salary in
(select min(salary) from employee group by dno);

-- having
select dno, min(salary) from employee group by dno 
having dno <> (select dno from employee where ename='SCOTT');

select eno, ename, salary, dno from employee where salary in -- multi row supauery
(select min(salary) from employee group by dno 
having dno <> (select dno from employee where ename='SCOTT'));

-- exists(subquery에서만 적용 가능)
-- 해당 row가 존재하는지만 판별
select eno, ename, dno from employee e where exists
(select dno, dname from department where e.dno=10);

select eno, ename, dno from employee e where not exists
(select dno, dname from department where e.dno=10) order by dno;

select eno, ename, dno from employee e where exists
(select dno, dname from department where e.dno=40);

-- 부서 번호가 30,20,10인 직원 출력
select dno, eno from employee where dno in(10,20,30) order by 1,2;

select dno, eno from employee where exists
(select dno from department where dno in (30,20,10)) order by 1,2;