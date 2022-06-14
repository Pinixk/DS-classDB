select * from employee; -- 전체 데이터 찾기
select eno, ename, job, salary from employee; -- 선별적 찾기
select * from employee where dno = 10; -- 조건적 찾기
-- les를 제외하면 모두 작은 따옴표('')로 표시


-- 문자열 추가
select ename || '(' || eno || ')', job, salary from employee;
select ename || '(' || dno || ')', job, salary from employee;

-- 데이터 값 변동
select ename , job, salary+100 from employee;
select ename , job, salary*12 from employee;
select ename , job, salary*12, commission from employee;
select ename , job, salary*12+nvl(commission,0) "1년치 연봉" from employee;

-- Join
select eno, ename, e.dno, dname from employee e, department d
where e.dno = d.dno;

select dno, dname, d.loc, cityname from department d, loc l 
where d.loc = l.loc order by d.loc;
select dno, dname, l.loc, cityname from department d, loc l 
where d.loc = l.loc order by d.loc desc;

-- 오름차순, 내림차순
select * from employee order by dno;
select * from employee order by dno, salary;
select * from employee order by dno asc, salary desc;

-- 데이터의 대,소문자 구분
select * from employee where ename = 'smith';
select * from employee where ename = 'SMITH';
select * from employee where ename = upper('smith');
select eno, lower(ename) from employee where ename = upper('smith');

-- 연산자
select * from employee where hiredate > '85/01/01';
select * from employee where not hiredate > '85/01/01';


select * from employee where salary >= 1000 and salary <= 2000;
select * from employee where salary between 1000 and 2000;
select * from employee where salary not between 1000 and 2000;
select * from employee where not salary between 1000 and 2000;

select * from employee where dno = 10 or dno = 20;
select * from employee where dno in (10,20);
select * from employee where dno not in (10,20);
select * from employee where not dno in (10,20);
select * from employee where dno <> 30; -- '<>' = '!='
select * from employee where not(dno = 30);

select * from employee where commission is null;
select * from employee where commission is not null;
select * from employee where nvl(commission,0) = 0;

select eno, ename, commission, nvl(commission, 100) a from employee; -- if문
select eno, ename, commission, nvl2(commission, commission*12, 100) a from employee; -- if else문

-- 문자열
select * from employee where ename like 'A%'; -- A로 시작하는 단어
select * from employee where ename like '%A'; -- A로 끝나는 단어
select * from employee where ename like '%A%'; -- A를 포함하는 단어
select * from employee where ename like '%A%E%'; -- A->E 를 포함
select * from employee where ename not like '%A%'; -- A를 포함하지 않는 단어
select * from employee where ename like '___'; -- 3자리 단어