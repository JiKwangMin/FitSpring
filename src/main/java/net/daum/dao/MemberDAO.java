package net.daum.dao;

import java.util.List;

import net.daum.vo.MemberVO;
import net.daum.vo.QnaVO;
import net.daum.vo.ReviewVO;
import net.daum.vo.ToAddressVO;

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

	
	public void addressSave(ToAddressVO vo);

	public int addressCnt(ToAddressVO vo);

	public void addressDefaultChange(ToAddressVO vo);

	public List<ToAddressVO> addressBook(ToAddressVO vo);

	public void addressEdit(ToAddressVO vo);

	public void addressDel(int to_addr_no);

	public ToAddressVO getAddress(ToAddressVO address);

}
