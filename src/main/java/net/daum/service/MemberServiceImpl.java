package net.daum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.MemberDAO;
import net.daum.vo.MemberVO;

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





	




}