-- 생성
create table test (
    idx number constraint IDX_NUM primary key,
    name varchar2(20)
);

insert into test values(11,'B1');
insert into test values(13,'Q1');
insert into test values(12,'E1');
insert into test values(15,'A1');
insert into test values(14,'M1');

-- 찾기
select * from test order by idx;

select /*+ index(test idx_num) */ * from test; 
-- hint, oracle에서만 사용