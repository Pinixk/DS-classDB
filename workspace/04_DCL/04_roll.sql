-- 찾기
select * from user_role_privs;
select * from role_sys_privs where role='MYROLL';


-- 생성
create role myrole;
grant create session, create table, create synonym, 
create view to MYROLE ,create sequence to MYROLE;


-- 연결
create user user1 identified by 1234 default tablespace USERS;
grant MYROLE to user1;


-- 권한 보기
-- 사용자가 가진 권한
select * from dba_role_privs where GRANTEE = 'USER1';

-- 시스템이 가진 권한
select * from dba_sys_privs where GRANTEE = 'CONNECT';

-- 내가 만든 권한
select * from role_sys_privs role like 'MY%';


-- 삭제
drop role MYROLE;