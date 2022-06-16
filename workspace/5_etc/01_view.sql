create view V_EMP_DEP as
select eno, ename, salary, job, hiredate, e.dno, d.dname 
from employee e, department d
where e.dno=d.dno;
-- 덮어 쓰기
create or replace view v_emp_연봉 as
select eno, ename, salary from emp;



-- 데이터 넣기
create or replace view v_emp_연봉 as
select eno, ename, salary from emp;

insert into "V_EMP_연봉" values(9999,'KBJ',5000);
-- OK

create or replace view v_emp_연봉 as
select eno, ename, salary, salary*12 연봉 from emp;

insert into "V_EMP_연봉" values(9999,'KBJ',5000, 5000*12);
-- 'salary*12는 가상 column'임으로 작동 불가

create view v_dno_sum as 
select dno, sum(salary) 합, round(avg(salary)) 평균 
from employee group by dno;
-- 생성부터 가상 column임으로 insert 불가