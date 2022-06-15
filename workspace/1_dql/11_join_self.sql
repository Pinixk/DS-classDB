-- self join
select e.eno, e.ename, e.manager, m.ename 매니저명
from employee e, employee m
where e.manager = m.eno;