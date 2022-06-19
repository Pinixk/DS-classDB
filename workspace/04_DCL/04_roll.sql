-- 생성
create role myrole;
grant create session, create table, create synonym, 
create view to MYROLE ,create sequence to MYROLE;


-- 연결
create user user1 identified by 1234 default tablespace USERS;
grant MYROLE to user1;


-- 권한 보기
select * from user_role_privs;
select * from role_sys_privs where role like 'MY%';
select * from role_tab_privs where owner like '%SYS%'


-- 찾기
select * from user_role_privs;
select * from role_sys_privs where role='MYROLL';



-- user1의 권한명 조회
select * from dba_role_privs where GRANTEE = 'USER1';

-- system role인 connect에 대한 새부내역 조회
select * from dba_sys_privs where GRANTEE = 'CONNECT';

-- 사용자 권한의 세부내역 조회
select * from role_sys_privs role like 'MY%';


-- 삭제
drop role MYROLE;