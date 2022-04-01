package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import net.daum.vo.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	//자동의존성 주입. sqlSession이 mybatis쿼리문 실행객체

	@Override
	public int getListCount(MemberVO m) {
		return this.sqlSession.selectOne("am_count",m);
	}//검색전후 회원수

	@Override
	public List<MemberVO> getMemberList(MemberVO m) {
		return this.sqlSession.selectList("am_list", m);
	}//검색전후 회원목록

	@Override
	public MemberVO getMem(String mem_id) {
		return this.sqlSession.selectOne("am_info",mem_id);
	}//회원상세정보+수정폼

	@Override
	public void editM(MemberVO m) {
		this.sqlSession.update("am_edit",m);		
	}//관리자에서 회원정보수정

	@Override
	public void delM(String mem_id) {
		this.sqlSession.delete("am_del",mem_id);		
	}//회원삭제
		
}










