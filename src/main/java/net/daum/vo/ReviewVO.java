package net.daum.vo;

import lombok.Getter;
import lombok.Setter;


public class ReviewVO {
	private int item_no;		//아이템넘버(ITEM_INFO TABLE) -> Item_name
	private String r_writer;	//작성자	-- 나중에 mem_id받아와서 r_writer에 등록
	private int r_no;			//글번호
	private String r_pwd;		//비번
	private String r_cont;		//내용
	private int r_rate;			//평점
	private int r_height;		//키		
	private int r_weight;		//몸무게
	private String r_size;		//구매 사이즈
	private String r_date;		//작성일
	
	//MEMBER 테이블 비교 
	private String mem_id;
	private String mem_pw;
	 	
	// REVIEW_IMG TABLE
	private int review_file_no;
	private String review_img;
	private String review_orign_name;

	//페이징 쪽나누기 관련변수
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
	    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드

    
    
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}    
   
    public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_pwd() {
		return r_pwd;
	}
	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}
	public String getR_cont() {
		return r_cont;
	}
	public void setR_cont(String r_cont) {
		this.r_cont = r_cont;
	}
	public int getR_rate() {
		return r_rate;
	}
	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}
	public int getR_height() {
		return r_height;
	}
	public void setR_height(int r_height) {
		this.r_height = r_height;
	}
	public int getR_weight() {
		return r_weight;
	}
	public void setR_weight(int r_weight) {
		this.r_weight = r_weight;
	}
	public String getR_size() {
		return r_size;
	}
	public void setR_size(String r_size) {
		this.r_size = r_size;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getReview_file_no() {
		return review_file_no;
	}
	public void setReview_file_no(int review_file_no) {
		this.review_file_no = review_file_no;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public String getReview_orign_name() {
		return review_orign_name;
	}
	public void setReview_orign_name(String review_orign_name) {
		this.review_orign_name = review_orign_name;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	   
}