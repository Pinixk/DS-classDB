-- 값이 같다면 null
select nullif('A','A'), nullif('A','B') from dual;

-- 값이 null이면 next index로 대체
select ename, commission, salary, COALESCE(commission, salary, 0) from employee; --갯수 상관 없음

-- join할 값이 없으면 임의로 생성
select ename, dno, decode(dno, 10,'회계', 20,'연구', 30,'경영' , '기타') 집무실 from employee;
select ename, dno, case when dno=10 then '회계' 
when dno=20 then '연구' 
when dno=30 then '경영' 
when dno=40 then '기타' end as dname 
from employee;

select ename, job, decode(job, 'CLERK',salary+100,
'ANALYST',  salary+500,
'SALESMAN', salary+300,
'MANAGER', salary+200,
salary+1000) 보너스
from employee;

select ename, job, case when job='ANALYST' then salary+500
when job='CLERK' then salary+100
when job='SALESMAN' then salary+300
when job='MANAGER' then salary+200
when job='PRESIDENT' then salary+1000
end as 보너스 from employee;
