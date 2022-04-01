package net.daum.vo;

public class MemberVO {

	/*되도록이면 컬럼명과 변수명을 같게 한다.*/
	  private String mem_id;
	   private String mem_pw;
	   private String mem_name;
	   private String mem_birth;
	   private String mem_email;
	   private String mem_phone;
	   private String mem_gender;
	   private String mem_hobby;
	   private String mem_oaddress;
	   private String mem_address;
	   private String mem_detailaddress;
	   private int mem_point;
	   private String mem_date;
	   private int mem_state; //가입 회원이면 1, 탈퇴 회원이면 2
	   private String mem_delcont;//탈퇴 사유
	   private String mem_deldate;//탈퇴 날짜
	   private int mem_rank;

	   // private String mem_emailchk;
	   // private String mem_address;
	
		

	   public String getMem_oaddress() {
	      return mem_oaddress;
	   }

	   public void setMem_oaddress(String mem_oaddress) {
	      this.mem_oaddress = mem_oaddress;
	   }

	   public String getMem_address() {
	      return mem_address;
	   }

	   public void setMem_address(String mem_address) {
	      this.mem_address = mem_address;
	   }

	   public String getMem_detailaddress() {
	      return mem_detailaddress;
	   }

	   public void setMem_detailaddress(String mem_detailaddress) {
	      this.mem_detailaddress = mem_detailaddress;
	   }

	   public String getMem_gender() {
	      return mem_gender;
	   }

	   public void setMem_gender(String mem_gender) {
	      this.mem_gender = mem_gender;
	   }

	   public String getMem_hobby() {
	      return mem_hobby;
	   }

	   public void setMem_hobby(String mem_hobby) {
	      this.mem_hobby = mem_hobby;
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

	   public String getMem_name() {
	      return mem_name;
	   }

	   public void setMem_name(String mem_name) {
	      this.mem_name = mem_name;
	   }

	   public String getMem_birth() {
	      return mem_birth;
	   }

	   public void setMem_birth(String mem_birth) {
	      this.mem_birth = mem_birth;
	   }

	   public String getMem_email() {
	      return mem_email;
	   }

	   public void setMem_email(String mem_email) {
	      this.mem_email = mem_email;
	   }

	   public String getMem_phone() {
	      return mem_phone;
	   }

	   public void setMem_phone(String mem_phone) {
	      this.mem_phone = mem_phone;
	   }

	   public int getMem_point() {
	      return mem_point;
	   }

	   public void setMem_point(int mem_point) {
	      this.mem_point = mem_point;
	   }
		public String getMem_date() {
			return mem_date;
		}
		public void setMem_date(String mem_date) {
			this.mem_date = mem_date.substring(0,10);//0이상 10미만 사이의 년월일만 반환
		}
		public int getMem_state() {
			return mem_state;
		}
		public void setMem_state(int mem_state) {
			this.mem_state = mem_state;
		}
		public String getMem_delcont() {
			return mem_delcont;
		}
		public void setMem_delcont(String mem_delcont) {
			this.mem_delcont = mem_delcont;
		}
		public String getMem_deldate() {
			return mem_deldate;
		}
		public void setMem_deldate(String mem_deldate) {
			this.mem_deldate = mem_deldate.substring(0,10);
		}

		public void setFind_field(String find_field) {
			// TODO Auto-generated method stub
			
		}

		public void setStartrow(int i) {
			// TODO Auto-generated method stub
			
		}

		public int getStartrow() {
			// TODO Auto-generated method stub
			return 0;
		}

		public void setEndrow(int i) {
			// TODO Auto-generated method stub
			
		}

		public void memberJoinMethod(MemberVO vo) {
			// TODO Auto-generated method stub
			
		}

		public int getMem_rank() {
			return mem_rank;
		}

		public void setMem_rank(int mem_rank) {
			this.mem_rank = mem_rank;
		}
	   
	}