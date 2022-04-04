package net.daum.service;

import net.daum.vo.OrderVO;

public interface OrderService {

	void orderInsert(OrderVO vo);

	OrderVO getOrder(OrderVO vo);

}
