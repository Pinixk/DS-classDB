-- SALESMAN 1250<=salary<=1600

-- all(조건문 미포함)
select eno, ename, job, salary from employee 
where salary > all(select salary from employee where job='SALESMAN');

select eno, ename, job, salary from employee 
where salary < all(select salary from employee where job='SALESMAN');

-- any(조건문 포함)
select eno, ename, job, salary from employee 
where salary < any(select salary from employee where job='SALESMAN');

select eno, ename, job, salary from employee 
where salary > any(select salary from employee where job='SALESMAN');