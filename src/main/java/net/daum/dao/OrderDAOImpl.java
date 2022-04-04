package net.daum.dao;

import java.util.List;

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
}
