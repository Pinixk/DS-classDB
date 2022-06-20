-- 생성
create sequence EMP_SEQ increment by 1 start with 1; -- default
create sequence EMP_SEQ increment by 10 start with 10;
-- 반복
alter sequence EMP_SEQ maxvalue 99999 cycle cache 5;

-- 데이터 추가
insert into emp(eno, ename) values(emp_seq.nextval, 'KBJ');
insert into emp(eno, ename) values(emp_seq.nextval, 'DAVID');

-- 다른 테이블에서도 활용 가능
create table dept as select * from department where 1=0;
insert into dept(dno, dname) values(emp_seq.nextval, 'RESEARCH');

-- 찾기
select * from user_sequences;
select * from user_objects where object_type='SEQUENCE';

-- 현재 값 보기
select emp_SEQ.currval from dual; -- 30

-- 삭제
select emp_SEQ.currval from dual; -- 30