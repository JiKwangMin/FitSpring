--qna 테이블 생성

--p_id								-- 상품아이디(p_name , p_path)
--q_path							-- qna 사진

create table qna(
q_no number(38) primary key			-- 게시판 번호
,q_title varchar2(200) not null		-- 제목
,q_cont varchar2(4000) not null		-- 내용
,q_writer varchar2(100) not null	-- 작성자
,q_pwd varchar2(20) not null		-- 비번										
,q_ref number(38)					-- 원본글과 답변글을 묶어주는 그룹번호 역할
,q_step number(38)					-- 원본글이 0, 첫번째답글 1. 원본글과 답변글을  구분하는 번호값
,q_level number(38)					-- 답변글 정렬 순서
,q_date date						-- 작성일
);

--qna_no_seq 시퀀스 생성
create sequence qna_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache;

select * from qna;

drop table qna;