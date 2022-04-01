package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class ReviewVO {
	// 상품이름 추가해야됨!!! 검색기능에 필요!
	private int r_no;			//글번호
	private String r_writer;	//작성자
	private String r_pwd;		//비번
	private String r_cont;		//내용
	private int r_hit;			//조회수
	private int r_rate;			//평점
	private int r_height;		//키		
	private int r_weight;		//몸무게
	private String r_size;		//구매 사이즈
	private String r_date;		//작성일
	
	//페이징 쪽나누기 관련변수
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
	
    
    
}
