-- 1. dept2 만들기
create table dept2(dno number(2,0), dname varchar2(14), loc varchar2(13), regdate timestamp);

-- 2. emp2 만들기 
create table dept2(eno number(2,0), ename varchar2(14), dno varchar2(2), regdate timestamp);

-- 3. emp2 수정
create table dept2(eno number(4,0), ename varchar2(25), dno varchar2(2), regdate date);

-- 4. employee 복사하여 employee2 만들기
create table employee2(emp_id, name, sal, dept_id) as select eno, ename, salary, dno from employee;

-- 5. employee2 테이블을 emp3로 변경
rename employee2 to emp3;

-- 6. emp2와 emp3 테이블을 지우기
drop table emp2;
drop table emp3;

-- 7. dept2 테이블에서 dname 지우기
alter table dept2 drop column dname;

-- 8. dept2 테이블에서 loc를 unused로 만들기
alter table dept2 set unused(loc);

-- 9. dept2 테이블에서 unused 칼럼을 모두 지우기
alter table dept2 drop unused column;

-- 10. employee 구조만 복사해 emp_insert 만들기
create table emp_insert as select * from employee where 1=0;

-- 11. 본인을 emp_insert에 추가하며 sysdate를 이용해 입사일을 오늘로 하시오
insert into emp_insert(ename, hiredate) values('KBJ',sysdate);

-- 12. emp_insert에 옆 사람을 추가하며 입사일을 to_date를 사용해 어제로 하시오
insert int emp_insert(ename, hiredate) values('LGH', to_date(sysdate-1, 'yyyy/mm/dd'));

-- 13. employee를 복사하여 emp_copy 만들기
create table emp_copy as select * from employee;

-- 14. emp_copy 사원번호가 7788인 사원의 부서번호를 10으로 변경;
update emp_copy set dno=10 where eno=7788;

-- 15. emp_copy에서 7788인 사원의 담당업무 및 급여를 7499와 일치 시키기
update emp_copy set (job, salary) = (select job, salary from emp_copy where eno=7499) where eno=7788;

-- 16. emp_copy 7369와 업무가 동일한 모든 사원의 부서번호를 7369와 같게 하시오.
update emp_copy set dno = (select dno from emp_copy where eno=7369) where job=(select job from emp_copy where eno=7369);

-- 17. department를 복사하여 dept_copy를 만들기
create table dept_copy as select * from department;

-- 18. dept_copy RESEARCH 부서 제거
delete dept_copy where dname='RESEARCH';

-- 19. dept-copy 부서번호가 10과 40인 부서를 제거
delete dept_copy where dno in (10, 40);