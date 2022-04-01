--review table 생성
-- p_id   	-- 상품아이디(p_name,p_path)
-- r_path	-- review 사진

create table review( 
r_no number(38) primary key			-- 글번호
,r_writer varchar2(100) not null	-- 작성자
,r_pwd varchar2(100) not null		-- 비번
,r_cont varchar2(4000) not null		-- 내용
,r_hit number(10) default 0			-- 조회수
,r_rate number(10) not null			-- 평점
,r_height number(10)				-- 키
,r_weight number(10)				-- 몸무게
,r_size varchar2(10)				-- 평소 사이즈
,r_date date						-- 작성일
);
drop table review;
--review_no_seq 시퀀스 생성
create sequence review_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache;

select * from review;