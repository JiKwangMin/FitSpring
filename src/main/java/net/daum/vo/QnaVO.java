package net.daum.vo;

public class QnaVO {
	
	//qna table
	private int item_no;
	private int q_no;
	private String q_title;
	private String q_cont;
	private String q_writer;
	private String q_pwd;
	private int q_ref;			//원본글과 답변글을 묶어주는 그룹번호
	private int q_step;			//원본글0, 첫번째답변글1
	private int q_level;		//답변글 정렬순서
	private String q_date;
	private int no;
	
	// MEMBER 테이블 비교
	private String mem_id;
	private String mem_pw;
	
	// qna_img table
	private int qna_file_no;
	private String qna_img;
	private String qna_origin_name;
	
	//페이징 쪽나누기 관련변수
    private int startrow1;//시작행 번 호
    private int endrow1;//끝행 번호
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
    
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_cont() {
		return q_cont;
	}
	public void setQ_cont(String q_cont) {
		this.q_cont = q_cont;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}
	public int getQ_ref() {
		return q_ref;
	}
	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}
	public int getQ_step() {
		return q_step;
	}
	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}
	public int getQ_level() {
		return q_level;
	}
	public void setQ_level(int q_level) {
		this.q_level = q_level;
	}
	public String getQ_date() {
		return q_date;
	}	
	public void setQ_date(String q_date) {
		this.q_date = q_date.substring(0,10);
	}
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
	public int getQna_file_no() {
		return qna_file_no;
	}
	public void setQna_file_no(int qna_file_no) {
		this.qna_file_no = qna_file_no;
	}
	public String getQna_img() {
		return qna_img;
	}
	public void setQna_img(String qna_img) {
		this.qna_img = qna_img;
	}
	public String getQna_origin_name() {
		return qna_origin_name;
	}
	public void setQna_origin_name(String qna_origin_name) {
		this.qna_origin_name = qna_origin_name;
	}
	public int getStartrow1() {
		return startrow1;
	}
	public void setStartrow1(int startrow1) {
		this.startrow1 = startrow1;
	}
	public int getEndrow1() {
		return endrow1;
	}
	public void setEndrow1(int endrow1) {
		this.endrow1 = endrow1;
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
}
