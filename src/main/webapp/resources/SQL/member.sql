--member 테이블 생성
CREATE TABLE member(
    mem_id VARCHAR(100) PRIMARY KEY,    -- 회원 아이디
    mem_pw VARCHAR(100),                -- 회원 비밀번호
    mem_name VARCHAR(100),              -- 회원 이름
    mem_birth VARCHAR(100),             -- 회원 생일
    mem_email VARCHAR(100),             -- 회원 이메일
    mem_phone VARCHAR(100),             -- 회원 전화번호
    mem_oaddress VARCHAR(100),          -- 회원 우편번호
    mem_address VARCHAR(100),           -- 회원 주소
    mem_detailaddress VARCHAR(100),     -- 회원 상세 주소
    mem_point NUMBER NOT NULL,         -- 회원 포인트
    mem_date date ,                       --가입날짜
    mem_state number(38),                 --가입회원 1, 탈퇴 회원이면 2
    mem_delcont varchar2(4000),          --탈퇴사유
    mem_deldate date                     --탈퇴날짜
);
drop table member;
select * from member;

insert into member values('aaa','123','','','','','','','','0','','','','');






