-- 1. Equi 조인을 사용하여 scott 사원의 부서번호와 부서이름을 출력하시오.
select ename, e.dno, d.dname from employee e,department d where ename = 'SCOTT' and e.dno = d.dno;

-- 2. inner join 과 on 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오. 
select eno, ename, d.dname, l.cityname 
from employee e 
join department d on(e.dno = d.dno) 
join loc l on(d.loc = l.loc);

-- 3. inner join과 using 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유목록(한 번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
select dno, job, cityname 
from employee 
join department using(dno) 
join loc using(loc)
where dno=10;

-- 4. natural join을 사용하여 커미션을 받는 모든 사원의 이름, 부서명, 지역명을 출력하시오.
select ename, dname, cityname 
from employee
natural join department 
natural join loc
where commission is not null;

-- 5. equi 조인과 wildcard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select e.ename, d.dname from employee e, department d where e.ename like '%A%' and e.dno = d.dno;

-- 6. natural join을 사용하여 Newyork에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select ename, dname, cityname 
from employee
natural join department 
natural join loc
where cityname='NEWYORK';

-- 7. self join을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오.
select e.eno, e.ename, e.manager, m.ename 매니저명
from employee e, employee m
where e.manager = m.eno;

-- 8. outer join, self join을 사용하여 관리자가 없는 사원을  포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select e.eno, e.ename, e.manager, m.ename 매니저명
from employee e, employee m
where e.manager = m.eno(+) order by e.eno desc;

select e.eno, e.ename, e.manager, m.ename 매니저명
from employee e left outer join employee m
on(e.manager = m.eno) order by e.eno desc;

-- 9. self join 을 사용하여 사원명, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오.
select t.ename, t.dno from employee e, employee t
where e.dno=t.dno
and e.ename='SCOTT'
and t.ename<>'SCOTT';

select ename, dno from employee where dno =
(select dno from employee where ename='SCOTT');

-- 10. self join 을 사용하여 ward 사원보다 늦게 입사한 사원의이름과 입사일을 출력하시오.
select h.ename, h.hiredate from employee e, employee h 
where e.hiredate < h.hiredate and e.ename='WARD'
order by h.hiredate;

select ename, hiredate from employee where hiredate > 
(select hiredate from employee where ename='WARD')
order by hiredate;

-- 11. self join을 사용하여 관리자 보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.ename, e.hiredate, m.ename, m.hiredate
from employee e, employee m
where e.manager = m.eno(+)
and e.hiredate < m.hiredate
order by e.hiredate;

select e.ename, e.hiredate, m.ename, m.hiredate
from employee e left outer join employee m on(e.manager = m.eno)
where e.hiredate < m.hiredate
order by e.hiredate;
