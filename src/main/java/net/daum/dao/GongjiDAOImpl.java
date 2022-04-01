package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import net.daum.vo.GongjiVO;

@Repository
public class GongjiDAOImpl implements GongjiDAO {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<GongjiVO> getList() {
		return this.sqlSession.selectList("g_list");
	}

	@Override
	public void updateHit(int gongji_no) {
		this.sqlSession.update("g_hit",gongji_no);
	}//공지 조회수증가	

	@Override
	public GongjiVO getGCont(int gongji_no) {
		return this.sqlSession.selectOne("g_cont",gongji_no);
	}
}










