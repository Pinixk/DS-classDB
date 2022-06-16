create table EMPS(사원번호 number(2,0), 이름 varchar2(14), 부서 varchar2(14));

insert all
into EMPS values(10, '김기획', '기획부')
into EMPS values(20, '박인사', '인사부')
into EMPS values(30, '최재무', '재무부')
into EMPS values(40, '오영업', '영업부')
select * from dual;

commit;

delete emps where 사원번호 = 40;
delete emps where 사원번호 = 30;

savepoint s1;

delete emps where 사원번호 = 20;

savepoint s2;

delete emps where 사원번호 = 10;


rollback to s1;

select * from EMPS;