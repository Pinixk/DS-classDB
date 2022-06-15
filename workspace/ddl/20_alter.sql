-- 추가
alter table dept add (reg_date date);

-- 이름 변경
alter table dept rename column reg_date to reg;

-- 타입 변경
alter table dept modify reg varchar2(20);

-- 삭제
alter table dept drop column reg;

-- 비가시화
alter table dept set unused(dno);
alter table dept drop unused columns; -- 리소스까지 삭제