create table emp (
    eno number(4),
    ename varchar2(20),
    salary number(7) 
	 constraint CK_EMO_SALARY 
	 check(salary > 0)
);
-- not null column 레벨 O, table 레벨 O


-- check에 위배
insert into emp values(1,'KBJ',0);
-- 작동 안함