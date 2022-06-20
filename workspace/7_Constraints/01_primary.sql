-- unique, not null 속성을 가짐

create table dept(
    dno number(2) primary key,
    dname varchar2(14),
    loc varchar2(2)
);

create table dept(
    dno number(2) constraint PK_D1 primary key,
    dname varchar2(14),
    loc varchar2(2)
); -- index 테이블 이름 지정

create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(2),
    constraint PK_D1 primary key(dno, dname) 
); 
-- primary key column레벨 O, table 레벨 O

-- primary key 추가 / 이름 변경 / 삭제
alter table dept add constraint PK_D1 primary key(dno);
alter table dept rename constraint PK_D1 to PK_D2;
alter table dept drop constraint PK_D2;