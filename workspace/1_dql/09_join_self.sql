-- self join
select e.eno, e.ename, e.manager, m.ename ๋งค๋์ ๋ช
from employee e, employee m
where e.manager = m.eno;