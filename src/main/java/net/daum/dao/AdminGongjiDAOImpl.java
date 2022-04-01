package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.GongjiVO;

@Repository
public class AdminGongjiDAOImpl implements AdminGongjiDAO {

	@Inject
	private SqlSession sqlSession;//mybatis 쿼리문 실행 객체
	//를 생성, 자동의존성 주입

	@Override
	public int getListCount(GongjiVO g) {
		return this.sqlSession.selectOne("ag_count",g);
	}//검색 전후 레코드 개수

	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.sqlSession.selectList("ag_list",g);
	}//검색 전후 공지목록

	@Override
	public void insertG(GongjiVO g) {
       	this.sqlSession.insert("ag_in",g);	
	}

	@Override
	public GongjiVO getGongjiCont(int no) {
		return this.sqlSession.selectOne("ag_cont",no);
	}

	@Override
	public void editGongji(GongjiVO g) {
		this.sqlSession.update("ag_edit",g);		
	}

	@Override
	public void delG(int no) {
		this.sqlSession.delete("ag_del",no);		
	}
}













