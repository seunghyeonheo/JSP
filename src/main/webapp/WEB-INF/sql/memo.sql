use webtest;
create table memo (
	memono		int 	     not null auto_increment primary key,
    wname		varchar(20)   not null,
    title       varchar(200)  not null,
    content     varchar(4000)  not null,
    passwd      varchar(10)    not null,
    viewcnt     int           default 0,
    wdate       date          not null,
    grpno		int			  default 0,
    indent      int           default 0,
    ansnum		int           default 0
);

-- list
select memono, wname, title, wdate, grpno, indent, ansnum
from memo
-- where wname like '%홍%'   -- wname, title, content, title_content, 전체출력
order by grpno desc, ansnum
limit 0, 5;

-- create

select ifnull(max(grpno),0) + 1 from memo m;

insert into memo (wname, title, content, wdate, grpno, passwd)
values ('홍길동','메모제목','메모내용',sysdate(),
(select ifnull(max(grpno),0) + 1 from memo m), '1234');

insert into memo (wname, title, content, wdate, grpno, passwd)
values ('홍길동','메모제목','메모내용',sysdate(),
(select ifnull(max(grpno),0) + 1 from memo m), '1234');

-- read (조회수 증가)

-- update (passCheck)

-- delete (passCheck)

-- passCheck

-- 답변: readReply(부모의 grpno, indent, ansnum, title, memono)

-- 답변: updateAnsnum (답변 순서 재정렬)

-- 답변: createReply(답변등록)

