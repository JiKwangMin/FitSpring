package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.WishVO;

@Repository
public class WishListDAOImpl implements WishListDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void wishInsert(WishVO wishVO) {
		this.sqlSession.insert("wishInsert", wishVO);
	}

	@Override
	public int wishCheck(WishVO wishVO) {
		return this.sqlSession.selectOne("wishCheck",wishVO);
	}

	@Override
	public void wishDelete(WishVO wishVO) {
		this.sqlSession.delete("wishDelete", wishVO);
	}

	@Override
	public int listCnt(WishVO vo) {
		return this.sqlSession.selectOne("listCnt",vo);
	}

	@Override
	public List<WishVO> getList(WishVO vo) {
		return this.sqlSession.selectList("getWishList",vo);
	}
}
