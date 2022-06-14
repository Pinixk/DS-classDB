-- cross join
select * from  loc, department;
select * from  department;

-- equi join
select eno, ename, d.dno, dname from employee e, department d where e.dno = d.dno; -- where
select eno, ename, d.dno, dname from employee e join department d on(e.dno = d.dno); -- join on(조건)
select eno, ename, dno, dname from employee join department using(dno); -- join using(셀)
select eno, ename, dno, dname from employee natural join department; -- 같은 셀이 여러 종류일 때 꼬인다

select eno, ename, d.dno, dname, l.loc, cityname 
from employee e, department d, loc l 
where e.dno = d.dno and d.loc = l.loc;

select eno, ename, d.dno, dname, l.loc, cityname 
from employee e 
join department d on(e.dno = d.dno) 
join loc l on(d.loc = l.loc);

select eno, ename, dno, dname, loc, cityname 
from employee 
join department using(dno) 
join loc using(loc);

select eno, ename, dno, dname, loc, cityname 
from employee
natural join department 
natural join loc; 

