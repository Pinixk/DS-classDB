create table customer(
    ID varchar2(20) unique,
    PWD varchar2(20) ,
    NAME varchar2(30) ,
    PHONE varchar2(20),
    ADDRESS varchar2(100)
);

create table customer(
    ID varchar2(20) constraint UQ_CUSTOMER_ID unique,
    PWD varchar2(20) ,
    NAME varchar2(30) ,
    PHONE varchar2(20),
    ADDRESS varchar2(100)
);

create table customer(
    ID varchar2(20) ,
    PWD varchar2(20) ,
    NAME varchar2(30) ,
    PHONE varchar2(20),
    ADDRESS varchar2(100),
    constraint UQ_CUSTOMER_ID unique(ID)
);
-- not null column 레벨 O, table 레벨 O


-- 데이터 추가
insert into customer(pwd, name) values('1111','KBJ');
-- unique는 null 값의 영향을 받지 않는다

insert into customer(id, pwd, name) values('PINIXK','1111','KBJ');
-- 값을 넣는다면 다음부턴 중복 불가