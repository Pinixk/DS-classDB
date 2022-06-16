create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(2) constraint FK_DEPT_LOC references loc(loc)
);

create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(2)
    constraint FK_DEPT_LOC foreign key(loc) references loc(loc)
); 
-- foreign key column 레벨 O, table 레벨 O

-- 연결 시킬 키가 primary key여야 한다.
alter table loc add constraint pk_loc primary key(loc);

-- foreign key 추가/삭제
alter table dept add constraint fk_dept foreign key(loc) references loc(loc);
alter table dept drop constraint fk_dept;