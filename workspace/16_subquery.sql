-- 선택자
select eno, ename, dno, (select dname from department where dno = e.dno)부서명 from employee e;

select eno, ename, manager, (select m.ename from employee e, employee m where e.manager=m.eno) from employee; -- error
select eno, ename, manager, (select ename from employee where eno= e.manager) from employee e;

-- 조건절
select ename, dno, salary from employee where (select min(salary) from employee where dno=10) > salary;

-- table
select rownum, A.* from (select eno, ename, salary from employee order by salary desc) A;

select * from
(select rownum r, A.* from (select eno, ename, salary from employee order by salary desc) A)
where r between 6 and 10;
