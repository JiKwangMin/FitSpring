package net.daum.service;

import java.util.List;

import net.daum.vo.OrderVO;

public interface OrderService {

	void orderInsert(OrderVO vo);

	List<OrderVO> getOrder(OrderVO vo);

}
