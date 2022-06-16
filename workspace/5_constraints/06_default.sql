create table emp (
    eno number(4) constraint PK_EMP_ENO primary key,
    ename varchar2(20),
    salary number(7) constraint CK_EMO_SALARY check(salary > 0),
    commission number(7) DEFAULT 0
);
-- not null column 레벨 O, table 레벨 X