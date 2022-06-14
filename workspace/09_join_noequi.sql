-- no equi join

-- select eno, ename, salary, grade from employee natural join salgrade; -- error
-- select eno, ename, salary, grade from employee e join salgrade s using(e.salary between s.losal and s.hisal); --error

select eno, ename, salary, grade from employee e, salgrade s where e.salary between s.losal and s.hisal;
select eno, ename, salary, grade from employee e join salgrade s on(e.salary between s.losal and s.hisal);