use webtest;
drop table if exists bbs;
CREATE TABLE bbs ( 
  bbsno     int NOT NULL auto_increment primary key,   -- 글 일련 번호
  wname     VARCHAR(20)      NOT NULL,   -- 글쓴이 
  title     VARCHAR(100)     NOT NULL,   -- 제목(*) 
  content   VARCHAR(4000)    NOT NULL,   -- 글 내용 
  passwd    VARCHAR(15)      NOT NULL,   -- 비밀 번호 
  viewcnt   int              DEFAULT 0,  -- 조회수, 기본값 사용 
  wdate     DATE             NOT NULL,   -- 등록 날짜,  
  grpno     int              DEFAULT 0,  -- 부모글 번호 
  indent    int              DEFAULT 0,  -- 답변여부,답변의 깊이
  ansnum    int              DEFAULT 0   -- 답변 순서 
);   

-- create
insert into bbs(wname, title, content, passwd, wdate, grpno)
values('왕눈이','제목','내용','1234', sysdate(), (select ifnull(max(grpno),0) + 1 from bbs b)); 
insert into bbs(wname, title, content, passwd, wdate, grpno)
values('홍길동','title2','내용2','1234', sysdate(), 
(select ifnull(max(grpno),0)+1 from bbs b)
);
insert into bbs(wname, title, content, passwd, wdate, grpno)
values('아로미','제목3','내용3','1234', DATE_sub(sysdate(), INTERVAL 3 DAY) ,
(select ifnull(max(grpno),0)+1 from bbs)
);

select ifnull(max(grpno),0)+1 from bbs; -- 읽어온 데이터가 null이면 내가 치환하고 싶은 값으로 치환하겠다. null을 0으로 대신 읽어오겠다는 뜻
-- list
select bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum
from bbs
-- where title like '%t%'
-- or content like '%t%'
order by bbsno desc
limit 0, 5;  -- 첫 번째 행부터 다섯건만 가져오겠다.

select count(*) from bbs;
-- where wname like '%홍%';

-- 조회수 증가 
update bbs
set viewcnt = viewcnt + 1
where bbsno = 1;

-- 조회
select bbsno, wname, title, content, viewcnt, wdate
from bbs
where bbsno = 1;

-- 패스워드 검사 
select count(bbsno) as cnt
from bbs
where bbsno = 1
and passwd = '1234';

-- update
update bbs 
set 
    wname = '김길동',
	title = '비오는 날',
    content = '개구리 연못'
where bbsno  = 1;

-- delete
delete from bbs
where bbsno = 1;

select * from bbs;

delete from bbs;

select * from bbs;