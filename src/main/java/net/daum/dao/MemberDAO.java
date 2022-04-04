package net.daum.dao;

import net.daum.vo.MemberVO;

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

	

}
