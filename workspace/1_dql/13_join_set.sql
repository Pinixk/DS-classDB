-- 합집합
select * from employee where dno in(20,30)
union
select * from employee where dno in(10,30);

select ename, dno from employee where dno in(20,30)
union all -- 겹친 부분도 한번 더 더함
select ename, dno from employee where dno in(10,30); 

-- 교집합
select * from employee where dno in(20,30)
intersect
select ename, dno from employee where dno in(10,30);

-- 차집합
select ename, dno from employee where dno in(20,30)
minus -- (except)
select ename, dno from employee where dno in(10,30);