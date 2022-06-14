-- 문자 함수
-- dual은 더미 데이터

-- 대,소문자
select 'Oracle Database' from dual;
select upper('Oracle Database') from dual;
select lower('Oracle Database') from dual;
select initcap('don''t stop me') from dual; -- '를 하고 싶으면 ''

-- 문자 길이
select length('hello world') from dual; -- 공백 포함
select length('안녕 세상아') from dual;
select lengthb('hello world') from dual; -- lengthb는 바이트 단위 표시
select lengthb('안녕 세상아') from dual; -- 한글은 한 글자당 3byte

-- 문자 병합
select concat('Oracle','Database') from dual;
select concat('Oracle','Database','world') from dual; -- 매개변수 3개는 안됨
select concat('Oracle','Database'||'world') from dual; -- || 붙이면 몇 개든 가능
select concat('Oracle','hellow '||' world') from dual;

-- 선택 출력
select substr('hello world', 3,3) from dual; -- 첫번째 index: 시작점, 두번째 index: 길이
select substrb('안녕 세상아', 0,10) from dual; -- index도 byte 단위로
select * from employee where substr(ename,3,2)='NG';

-- 선택 문자의 위치
select instr('Hello World', 'w') from dual;
select instr('Hello World', 'W') from dual;
select instrb('Hello World', 'o') from dual;

-- 출력 범위
select rpad(ename, 3, ' ') from employee; -- right padding
select lpad(ename, 7, ' ') from employee; -- light padding
select rpad(ename, 7, '*') from employee;
select rpad(ename, 7, '*'), lpad(salary,10,0) from employee;

-- 공백
select trim('    he    llo ') from dual;
select ltrim('    he    llo ') from dual;
select rtrim('    he    llo ') from dual;

-- 문자 대체
select regexp_replace('hello world', 'o', '') from dual; -- oracle만 가능
select ename, substr(ename,1,1) || regexp_replace(substr(ename,2),'[A-Z]','*') from employee;
select regexp_replace(ename, '[A-C]', '*') from employee;

select salary, translate(salary, '[0123456789]', '***********')from employee; -- 두번째 index는 첫 index에 대응하게 넣어줘야한다