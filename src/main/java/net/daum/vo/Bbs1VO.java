package net.daum.vo;

import lombok.Data;

@Data
public class Bbs1VO {
	
	private int bbs_no; //번호
    private String bbs_name; //글쓴이
    private String bbs_title; //글제목
    private String bbs_pwd; //비번
    private String bbs_cont; //내용
    private String bbs_file; //첨부파일과 경로
    private int bbs_hit; //조회수
    private int bbs_ref; //관리자 답글에서 원본글과 답변글을 묶어주는 그룹번호 역할
    private int bbs_step; //원본글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2, 즉 원본글과 답변글을 구분하는 번호값 이면서 몇번째 답변글인가를 알려준다.
    private int bbs_level; //답변글 정렬순서
    private String bbs_date; //등록날짜
    
    //페이징(쪽나누기)
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
    
    //검색기능->검색 필드와 검색어
    private String find_field;//검색 필드
    private String find_name;//검색어  
}
