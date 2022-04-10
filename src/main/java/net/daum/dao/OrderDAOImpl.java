package net.daum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void orderInsert(OrderVO vo) {
		this.sqlSession.insert("orderInsert",vo);
	}

	@Override
	public List<OrderVO> getOrder(OrderVO vo) {
		return this.sqlSession.selectList("getOrder",vo);
	}
	
	@Override
	public List<OrderVO> getOrderList(OrderVO ord) {
		return this.sqlSession.selectList("getOrderList",ord);
	}

	@Override
	public void orderInDateUpdate(OrderVO vo) {
		this.sqlSession.update("orderInDateUpdate",vo);
	}

	@Override
	public List<OrderVO> getOrderNo(Map<String, Object> map) {
		return this.sqlSession.selectList("getOrderNo",map);
	}

	@Override
	public List<OrderVO> getDetail(OrderVO ord) {
		return this.sqlSession.selectList("getDetail",ord);
	}

	@Override
	public void orderDel(OrderVO vo) {
		this.sqlSession.delete("orderDel",vo);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.sqlSession.selectOne("getTotal",map);
	}

	@Override
	public void orderCancel(OrderVO vo) {
		this.sqlSession.update("orderCancel",vo);
	}
}
