-- 1. employee 테이블 구조 복사 emp_copy 만들고 eno에 primary key 설정
create table emp_copy as select * from employee;
alter table emp_copy add constraint my_emp_pk primary key(eno);

-- 2. 위 제약조건을 검색하기 위한 쿼리
select * from user_objects where object_name = 'MY_EMP_PK';
select * from user_objects where object_name = 'MY_DEP_PK';
select * from user_constraints;

-- 3. emp_copy의 commission 컬럼에 0보다 큰 값만을 입렵하도록 제약조건 지정
alter table emp_copy 

-- 4. dep_copy와 emp_copy의 외래키 cascade로 설정
create table dep_copy as select * from department;
alter table dep_copy add constraint my_dep_pk primary key(dno);
alter table emp_copy add constraint my_emp_fk foreign key(dno) references dep_copy(dno) on delete CASCADE;