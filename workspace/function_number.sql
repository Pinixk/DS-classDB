select 98.7654 from dual;
select round(98.7654) from dual; -- 반올림
select round(98.7654, 2) from dual; -- 소수 2째자리에 반올림
select round(98.7654, -1) from dual; -- 1의 자리 반올림

select trunc(98.7654) from dual; -- 버림
select trunc(98.7654, 2) from dual; -- 소수 2째자리 뒤로 버림
select trunc(98.7654, -1) from dual; -- 1의 자리 버림

select ceil(98.7654) from dual; -- 올림
select ceil(98.7654*power(10,2))/power(10,2) from dual; -- power = 제곱

-- 그룹 함수
select sum(salary) from employee;
select avg(salary) from employee;

-- 부서번호가 10번인 사원들의 급여 합과 평균을 구하되 소수 2째까지 까지
select sum(salary) "급여 합" , ceil(avg(salary)*power(10,2))/power(10,2) 평균 from employee where dno in (10);

select ename, dno, sum(salary) "급여 합" , ceil(avg(salary)*power(10,2))/power(10,2) 평균 
from employee where dno in (10); -- error(ename, dno는 그룹함수가 아님)
select ename, dno, sum(salary) "급여 합" , ceil(avg(salary)*power(10,2))/power(10,2) 평균 
from employee where dno in (10) GROUP by dno, ename;

select mod(10,3) from dual; -- 나누기
select sqrt(16) from dual; -- 루트