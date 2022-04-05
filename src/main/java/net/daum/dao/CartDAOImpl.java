package net.daum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void cart(CartVO vo) {
		this.sqlSession.insert("cartInsert", vo);
	}

	@Override
	public int cartCheck(CartVO vo) {
		return this.sqlSession.selectOne("cartChk", vo);
	}

	@Override
	public List<CartVO> getList(CartVO vo) {
		return this.sqlSession.selectList("getCartList",vo);
	}

	@Override
	public void cartDel(CartVO vo) {
		this.sqlSession.delete("cartDel",vo);
	}

	@Override
	public void cartUpdate(CartVO vo) {
		this.sqlSession.update("cartUpdate",vo);
	}

	@Override
	public List<CartVO> getorderitem(Map<String, Object> map) {
		return this.sqlSession.selectList("getOrderItem",map);
	}

	@Override
	public void intotalprice(CartVO vo) {
		this.sqlSession.update("intopr",vo);
	}

	@Override
	public List<CartVO> getCartList(CartVO cart) {
		return this.sqlSession.selectList("car2",cart);
	}

	@Override
	public void delPay(CartVO cv) {
		sqlSession.delete("delPay",cv);
	}

}
