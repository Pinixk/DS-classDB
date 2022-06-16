create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(2) constraint FK_DEPT_LOC references loc(loc)
);

create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(2),
    constraint FK_DEPT_LOC foreign key(loc) references loc(loc)
); 
-- foreign key column 레벨 O, table 레벨 O

create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(2) 
);
alter table dept add constraint FK_DEPT_LOC foreign key(loc) references loc2(loc);




-- 연결 시킬 키가 primary key여야 한다.
alter table loc add constraint pk_loc primary key(loc);

-- primary key 삭제
delete from loc2 where loc=10;
-- !!! 연결 되어 있는 primary key 중 사용되고 있다면 지울 수 없다 

-- 해결법
alter table dept add constraint FK_DEPT_LOC foreign key(loc) references loc2(loc) 
on delete cascade; 
-- primary key를 삭제 시 연결된 모든 foreign key 같이 삭제

alter table dept add constraint FK_DEPT_LOC foreign key(loc) references loc2(loc) 
on delete set null;
-- primary key를 삭제 시 연결된 모든 foreign key 값이 null로 변경



-- foreign key 추가/이름 변경/삭제
alter table dept add constraint FK_DEPT_LOC foreign key(loc) references loc(loc);
alter table dept rename constraint FK_DEPT_LOC to FK_DEPT_LOC2;
alter table dept drop constraint FK_DEPT_LOC2;
-- modify 실행 안됨