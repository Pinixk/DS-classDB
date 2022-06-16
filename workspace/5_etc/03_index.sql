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

-- hint, oracle에서만 사용
select /*+ index(test idx_num) */ * from test; 
-- 숫자는 그냥 해도 괜찮음

create index idx_test_name on test(name); -- 문자열 index 생성
select /*+ index(idx_test_name) */ * from test where name > ' ';
-- 문자는 where name > ' ' 필요