-- 값이 같다면 null
select nullif('A','A'), nullif('A','B') from dual;

-- 값이 null이면 next index로 대체
select ename, commission, salary, COALESCE(commission, salary, 0) from employee; --갯수 상관 없음

-- 개채 수 세기
select count(*) from employee;
select count(commission) from employee; -- null을 포함하지 않기 때문

-- 중복 제거
select distinct job from employee;
-- select distinct job, sum(salary) from employee; -- error
select distinct job, sum(salary) from employee group by job;
select distinct job, sum(salary) from employee where salary>=1000 group by job;
select distinct job, sum(salary) from employee group by job having SUM(salary)>5000; -- group by는 having으로 조건

-- 랭킹
select ename, salary, rank()over(order by salary desc) 순위 from employee;
select ename, hiredate, salary, rank()over(order by salary desc, hiredate desc) 순위 from employee;
select dno, ename, hiredate, salary, rank()over(partition by dno order by salary desc, hiredate desc) 순위 from employee;

select ename, salary, dense_rank()over(order by salary desc) 순위 from employee;
select ename, hiredate, salary, dense_rank()over(order by salary desc, hiredate desc) 순위 from employee;

-- top n
select ename, salary, dense_rank() over(order by salary desc) from employee; -- 총 순위
select * from (select ename, salary, dense_rank()over(order by salary desc) 순위 from employee) where rownum <=5; -- 총 순위에서 상위 5명
select * from (select * from (select ename, salary, dense_rank()over(order by salary desc) 순위 from employee)) A where A.순위<=5; -- 전체를 A로 명명 A.순위로 값 도출

select ename, salary,순위 from (select ename, salary, dense_rank()over(order by salary desc) 순위 from employee) where rownum <=5;
select * from (select ename, salary, 순위 from (select ename, salary, dense_rank()over(order by salary desc) 순위 from employee)) A where A.순위<=5;

select * from employee order by salary desc fetch first 5 rows only; -- oracle 12 부터 가능

-- 범위 추출
select rownum, eno, ename, salary from(select eno, ename, salary from employee order by salary desc);
-- select rownum r, eno, ename, salary from(select eno, ename, salary from employee order by salary desc) where r >=6 and r <=10; -- error
select * from (select rownum R, eno, ename, salary from(select eno, ename, salary from employee order by salary desc)) A where A.R>=6 and A.R <= 10;

-- join할 값이 없으면 임의로 생성
select ename, dno, decode(dno, 10,'회계', 20,'연구', 30,'경영' , '기타') 집무실 from employee;
select ename, dno, case when dno=10 then '회계' 
when dno=20 then '연구' 
when dno=30 then '경영' 
when dno=40 then '기타' end as dname 
from employee;

select ename, job, salary, case when job='ANALYST' then salary+500
when job='CLERK' then salary+100
when job='SALESMAN' then salary+300
when job='MANAGER' then salary+200
when job='PRESIDENT' then salary+600
end as 보너스 from employee;

select ename, job, salary, decode(job, 'ANALYST', salary+500,
'CLERK', salary+100,
'SALESMAN', salary+300,
'MANAGER', salary+200,
'PRESIDENT', salary+600) 보너스
from employee;

select count(보너스), sum(보너스), round(avg(보너스)), max(보너스), min(보너스) from  -- subquery의 형태
(select ename, job, salary, 
decode(job, 'ANALYST', salary+500,
'CLERK', salary+100,
'SALESMAN', salary+300,
'MANAGER', salary+200,
'PRESIDENT', salary+600) 보너스
from employee);