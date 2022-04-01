-- bbs 자료실 테이블
create table bbs(
  bbs_no number(38) primary key --번호
  ,bbs_name varchar2(50) not null --글쓴이
  ,bbs_title varchar2(200) not null -- 글제목
  ,bbs_pwd varchar2(50) not null --비번
  ,bbs_cont varchar2(4000) not null -- 글내용
  ,bbs_file varchar2(200) --첨부한 이진파일명과 경로
  ,bbs_hit number(38) default 0 --조회수
  ,bbs_ref number(38) --관리자 답변글을 만들때 원본글과 답변글을 묶어주는 기능을 하는 글 그룹번호
  ,bbs_step number(38) -- 원본글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2 -> 원본글과 답변글을 구분하는 번호값이면서,몇번째 답변글인가를 알려준다. 
  ,bbs_level number(38) --답변글 정렬순서
  ,bbs_date date --글 등록날짜
);

select * from bbs order by bbs_no desc;

--bbs_no_seq 시퀀스 생성 -> 시퀀스는 번호 발생기
create sequence bbs_no_seq
start with 1 --1 부터 시작
increment by 1 --1 씩 증가
nocache; --임시 저장 장소를 사용 안함.

-- bbs_no_seq 시퀀스 다음 번호값 확인
select bbs_no_seq.nextval from dual;