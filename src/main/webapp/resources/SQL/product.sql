create table product(
 p_id int primary key					-- 상품아이디
 ,p_path varchar2(500) not null			-- 파일경로
 ,p_category1 varchar2(20) not null		-- 대분류
 ,p_category2 varchar2(20) not null		-- 소분류
 ,p_name varchar2(40) not null			-- 상품이름
 ,p_size varchar2(10) not null			-- 상품사이즈
 ,p_color varchar2(15) not null			-- 상품색상
 ,p_price int not null					-- 상품가격
 ,p_activition varchar2(2) not null		-- 상품활성화 여부 Y/N
 ,p_stock int not null					-- 재고
 ,p_sell int not null					-- 판매수
 ,p_date date							-- 상품등록일
);

drop table product;

select * from product;

