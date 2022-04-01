package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.AdminMemberDAO;
import net.daum.vo.MemberVO;

@Service
public class AdminMemberServiceImpl 
implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public int getListCount(MemberVO m) {
		return this.adminMemberDAO.getListCount(m);
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO m) {
		return this.adminMemberDAO.getMemberList(m);
	}

	@Override
	public MemberVO getMem(String mem_id) {
		return this.adminMemberDAO.getMem(mem_id);
	}

	@Override
	public void editM(MemberVO m) {
		this.adminMemberDAO.editM(m);		
	}

	@Override
	public void delM(String mem_id) {
		this.adminMemberDAO.delM(mem_id);		
	}		
}









