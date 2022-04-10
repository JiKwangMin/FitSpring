package net.daum.dao;

import net.daum.vo.MemberVO;
import net.daum.vo.QnaVO;
import net.daum.vo.ReviewVO;

public interface MemberDAO {

	public void memberJoin(MemberVO vo);

	public int idCheck(String mem_id) throws Exception;

	public MemberVO findpw(MemberVO vo);
	
	void updatePw(MemberVO vo);
	
	public MemberVO findid(MemberVO vo);
   
	
	MemberVO getMember(String mem_id);

	public MemberVO loginCheck(MemberVO m);

	public String getState(String mem_id);

	public MemberVO getMeminfo(MemberVO mm);


	public int getPoint(String mem_id);

	public void mp(MemberVO mm);

	public String getpwd(ReviewVO ri);

	public String getrepwd(QnaVO qi);

	public String getqid(QnaVO qi);

	public String getrid(ReviewVO ri);

	

}
