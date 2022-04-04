package net.daum.dao;

import net.daum.vo.OrderVO;

public interface OrderDAO {

	void orderInsert(OrderVO vo);

	OrderVO getOrder(OrderVO vo);
}
