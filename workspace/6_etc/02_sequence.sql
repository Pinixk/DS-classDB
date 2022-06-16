-- 생성
create sequence EMP_SEQ increment by 1 start with 1; -- default
create sequence EMP_SEQ increment by 10 start with 10;

-- 데이터 추가
insert into emp(eno, ename) values(emp_seq.nextval, 'KBJ');
insert into emp(eno, ename) values(emp_seq.nextval, 'DAVID');