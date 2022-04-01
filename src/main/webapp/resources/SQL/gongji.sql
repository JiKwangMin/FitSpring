--gongji.sql
create table gongji(
 gongji_no number(38) primary key --번호
 ,gongji_name varchar2(30) not null --작성자
 ,gongji_title varchar2(200) not null --공지제목
 ,gongji_pwd varchar2(20) not null --공지비번
 ,gongji_cont varchar2(4000) not null --공지내용
 ,gongji_hit number(38) default 0 --조회수
 ,gongji_date date --공지등록날짜
);

select * from gongji order by gongji_no desc;

--g_no_seq 시퀀스 생성
create sequence g_no_seq
start with 1
increment by 1
nocache;

insert into gongji (gongji_no,gongji_name,gongji_title,
gongji_pwd,gongji_cont,gongji_date)
values(g_no_seq.nextval,'관리자','공지제목','777',
'공지내용',sysdate);













