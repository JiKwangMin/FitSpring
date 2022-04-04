package net.daum.dao;

import java.util.List;

import net.daum.vo.OrderVO;

public interface OrderDAO {

	void orderInsert(OrderVO vo);

	List<OrderVO> getOrder(OrderVO vo);
}
