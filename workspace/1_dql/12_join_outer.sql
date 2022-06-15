-- outer join
select e.eno, e.ename, e.manager, m.ename 매니저명
from employee e, employee m
where e.manager = m.eno(+) and e.dno = 10;

select e.eno, e.ename, e.manager, m.ename 매니저명
from employee e left outer join employee m
on(e.manager = m.eno) where e.dno = 10;