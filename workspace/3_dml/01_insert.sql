-- 데이터 넣기
insert into dept2 values(10,'accounting',40);

-- 데이터 선택적 넣기
insert into dept2(dno,dname) values(20,'RESEARCH');
insert into dept2(dno) values(30);
insert into dept2 select * from department; -- 무결성이 무너짐, primary key 필요

-- 테이블 추가 후 데이터 넣기
alter table dept2 add regdate date;
insert into dept2 values(40, 'CLERK', 10, sysdate);
insert into dept2 values(40, 'CLERK', 10, to_date('20220614','yyyy/mm/dd'));

-- 다수 한번에 넣기
insert all
into dept2 values(60, 'A', 10, sysdate)
into dept2 values(70, 'A', 10, sysdate)
into dept2 values(80, 'A', 10, sysdate)
into dept2 values(90, 'A', 10, sysdate)
select * from dual;