-- User 목록 보기
select * from all_users order by username;
select * from USER_users order by username;



-- user 생성(root 서버로 가서)
-- 11g 버전 까지
create user user1 identified by 1234 default tablespace users;

-- 11c 버전 이후
create user c## user1 identified by 1234 default tablespace users;

alter session set "_oracle_script" = true;
create user user1 identified by 1234 default tablespace users;



-- 권한 주기
-- SYSTEM 
-- 로그인 권한
grant create session to user1;

-- table 생성 권한 / space 할당
grant create table to user1;
grant resource to user1;

-- 계정 
--자신 테이블에 대한 권한 주기
grant select on user1.test to user2;
grant select on user1.test to public; -- 모든 계정



-- 권한 뺏기 
revoke resource from user2;
-- 다른 계정에 준 테이블 권한 뺏기
revoke select on user1.test from user2;



--자신이 받은 권한 보기
select * from session_privs;



-- user 삭제
drop user "USER1" cascade;