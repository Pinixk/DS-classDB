-- 추가
alter table dept add (reg_date date);

-- 이름 변경
alter table dept rename column reg_date to reg;
-- table 이름 변경
rename dept3 to dept2;

-- 타입 변경
alter table dept modify reg varchar2(20);
alter table dept2 modify dno not null;

-- 삭제
alter table dept drop column reg;

-- 비가시화
alter table dept set unused(dno);
alter table dept drop unused columns; -- 리소스까지 삭제
