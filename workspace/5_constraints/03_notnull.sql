create table customer(
    ID varchar2(20) not null,
    PWD varchar2(20) not null,
    NAME varchar2(30) constriant NN_NAME not null,
    PHONE varchar2(20),
    ADDRESS varchar2(100)
);

-- 데이터 추가
insert into customer(name, phone) values('KBJ','010-8977-3917');  -- null이 있으므로 작동X
insert into customer(id, pwd, name, phone) values('PINIXK','1111','KBJ','010-8977-3917');

-- not null 추가
alter table customer modify phone not null; -- sys_00000
alter table customer modify phone constraint NN_CUSTOMER_PHONE not null;
--데이터에 null 값이 이미 있다면 해당 key는 not null을 추가 할 수 없다

-- not null 데이터 삭제
alter table customer drop constraint NN_CUSTOMER_PHONE;