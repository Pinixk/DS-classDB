--테이블 생성
-- classic
create table dept(dno number(2,0), dname varchar2(14), loc varchar2(13));
desc dept;
select * from dept;
-- subquery
create table dept2 as select * from department;
desc dept2;
select * from dept2;
-- subquery(just construc)
create table dept3 as select * from department where 1=0;
desc dept3;
select * from dept3;


-- comment 생성
-- table
comment on table dept is 'department';
select * from user_tab_comments;
select * from user_tab_comments where table_name='DEPT';

-- column
comment on column dept.dno is '부서번호';
comment on column dept.dname is '부서명';
comment on column dept.loc is '지역코드';
select * from user_col_comments;
select * from user_col_comments where table_name='DEPT';


