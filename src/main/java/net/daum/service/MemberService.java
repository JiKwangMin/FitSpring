package net.daum.service;

import net.daum.vo.MemberVO;


public interface MemberService {
	

		public void memberJoinProcess(MemberVO vo);

		public int idCheck(String mem_id) throws Exception;

	
		public MemberVO findpw(MemberVO vo);
		
		public void updatePw(MemberVO vo);
		
		public MemberVO findid(MemberVO vo);

		
		MemberVO getMember(String mem_id);

		public MemberVO loginCheck(MemberVO m);

		public String getState(String mem_id);

		

		
		

		

		
	

	
}