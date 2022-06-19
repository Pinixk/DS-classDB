-- data 삭제
delete dept2 where dno = 90;
delete dept_copy where dname='RESEARCH';
delete dept_copy where dno in (10, 40);