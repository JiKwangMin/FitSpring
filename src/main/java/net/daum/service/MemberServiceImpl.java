package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.MemberDAO;
import net.daum.vo.MemberVO;
import net.daum.vo.QnaVO;
import net.daum.vo.ReviewVO;
import net.daum.vo.ToAddressVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	@Override
	public void memberJoinProcess(MemberVO vo) {
		dao.memberJoin(vo);
		
	}


	@Override
	public int idCheck(String mem_id) throws Exception {
		return this.dao.idCheck(mem_id);
	}

	@Override
	public void updatePw(MemberVO vo) {
		this.dao.updatePw(vo);
		
	}


	@Override
	public MemberVO findpw(MemberVO vo) {
		return this.dao.findpw(vo);
	}


	@Override
	public MemberVO findid(MemberVO vo) {
		return this.dao.findid(vo);
	}


	

	@Override
	public MemberVO getMember(String mem_id) {
		return this.dao.getMember(mem_id);
	}


	@Override
	public MemberVO loginCheck(MemberVO m) {
		
		return this.dao.loginCheck(m);
	}


	@Override
	public String getState(String mem_id) {
		return this.dao.getState(mem_id);
	}


	@Override
	public MemberVO getCartInfo(MemberVO mm) {
		return this.dao.getMeminfo(mm);
	}


	@Override
	public int getPoint(String mem_id) {
		return this.dao.getPoint(mem_id);
	}


	@Override
	public void mp(MemberVO mm) {
		this.dao.mp(mm);
	}

	@Override
	public String rfindpw(ReviewVO ri) {
		return this.dao.getpwd(ri);
	}


	@Override
	public String qfindpw(QnaVO qi) {
		return this.dao.getrepwd(qi);
	}


	@Override
	public String qfindid(QnaVO qi) {
		return this.dao.getqid(qi);
	}


	@Override
	public String rfindid(ReviewVO ri) {
		return this.dao.getrid(ri);
	}
	
	@Override
	public void addressSave(ToAddressVO vo) {
		this.dao.addressSave(vo);
	}


	@Override
	public int addressCnt(ToAddressVO vo) {
		return this.dao.addressCnt(vo);
	}


	@Override
	public void addressDefaultChange(ToAddressVO vo) {
		this.dao.addressDefaultChange(vo);
	}


	@Override
	public List<ToAddressVO> addressBook(ToAddressVO vo) {
		return this.dao.addressBook(vo);
	}


	@Override
	public void addressEdit(ToAddressVO vo) {
		this.dao.addressEdit(vo);
	}


	@Override
	public void addressDel(int to_addr_no) {
		this.dao.addressDel(to_addr_no);
	}


	@Override
	public ToAddressVO getAddress(ToAddressVO address) {
		return this.dao.getAddress(address);
	}

}