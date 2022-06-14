select sysdate, TIMESTAMP from dual;
select sysdate, localTIMESTAMP from dual;

-- 기본 연산
select sysdate from dual; 
select sysdate +1 from dual;
select sysdate -1 from dual;
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;
select sysdate-(sysdate -1) from dual;
select sysdate + 100/24 from dual; -- 시간을 날짜로 변환 계산

-- round=반올림, trunc=버림 
select round(sysdate) from dual;
select round(sysdate, 'cc') from dual; 
select to_char(round(sysdate, 'cc'),'yyyy/mm/dd') from dual;

select to_char(round(to_date('2051/11/12','yyyy/mm/dd'), 'cc'),'yyyy/mm/dd') from dual; -- cc: century 단위 반올림
select to_char(round(to_date('2051/11/12','yyyy/mm/dd'), 'yy'),'yyyy/mm/dd') from dual; -- yy: year(년도) 단위 반올림
select to_char(round(to_date('2051/11/16','yyyy/mm/dd'), 'mm'),'yyyy/mm/dd') from dual; -- mm: month(월) 단위 반올림
select to_char(round(to_date('2022/06/15','yyyy/mm/dd'), 'dd'),'yyyy/mm/dd') from dual; -- dd: week(주) 단위 반올림
select to_char(round(to_date('2022/06/15 12:01:01','yyyy/mm/dd hh:mi:ss'), 'hh'),'yyyy/mm/dd hh:mi:ss') from dual; -- hh: hour(시) 단위 반올림
select to_char(round(to_date('2022/06/15 12:01:01','yyyy/mm/dd hh:mi:ss'), 'mi'),'yyyy/mm/dd hh:mi:ss') from dual; -- mm: minuate(분) 단위 반올림
select to_char(round(to_date('2051/08/12','yyyy/mm/dd'), 'q'),'yyyy/mm/dd') from dual; -- q: quarter(분기) 단위 반올림

-- 날짜와 날짜 사이
select ename, round(sysdate - hiredate) "재직 일 수" from employee; -- 날짜 사이 일수
select ename, round(months_between(sysdate,hiredate)) "재직 월 수" from employee; -- 날짜 사이 월수
select ename, round(months_between(sysdate,hiredate)/12) "재직 년 수" from employee; -- 날짜 사이 년수

-- 달의 마지막 날
select sysdate, last_day(sysdate) from dual;
select sysdate, last_day(to_date('2022/02/22')) from dual; -- oracle에서만
select sysdate, to_date('2022/03/01')-1 from dual; -- 일반적인 방법

-- 표기 방식
select ename, to_char(hiredate, 'day') from employee; -- 요일로 출력
select ename, to_char(hiredate, 'dy') from employee; -- 요일 간단 출력
select ename, to_char(salary,'L99,999.00') from employee; -- 금액 표시
select ename, to_char(salary,'L00,000.00') from employee; -- 금액 표시(빈 공간 0으로 대체)

-- 문자를 숫자 포멧으로 변경
select to_number('100,000','999,999') from dual;