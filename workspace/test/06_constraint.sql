-- 1. employee 테이블 구조 복사 emp_copy 만들고 eno에 primary key 설정
create table emp_copy as select * from employee;
alter table emp_copy add constraint my_emp_pk primary key(eno);

-- 2. 위 제약조건을 검색하기 위한 쿼리
select * from user_objects where object_name = 'MY_EMP_PK';
select * from user_objects where object_name = 'MY_DEP_PK';
select * from user_constraints;

-- 3. emp_copy의 commission 컬럼에 0보다 큰 값만을 입렵하도록 제약조건 지정
create table emp_copy2 as select * from employee where 1=0;
alter table emp_copy2 add constraint MY_EMP_COMMISSION check(commission>0) ;

INSERT INTO EMP_COPY(ENO, COMMISSION) VALUES(10, 10);
select * from user_constraints where table_name='EMP_COPY';

-- 4. dep_copy와 emp_copy의 외래키 cascade로 설정
create table dep_copy as select * from department where 1=0;
alter table emp_copy add constraint my_emp_fk foreign key(dno) 
references dep_copy(dno) on delete CASCADE;
