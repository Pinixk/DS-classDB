-- tablespace 생성
create tablespace MYSPACE datafile 'MT_SPACE' size 2048m autoextend on next 4m
maxsize unlimited logging permanent extent management local autoallocate blocksize 8k segment space
management manual flashback on;

-- tablespace 지정
alter user user1 default tablespace MYSPACE;

select * from user_tablespaces;