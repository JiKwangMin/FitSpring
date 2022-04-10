package net.daum.dao;

import java.util.List;
import java.util.Map;

import net.daum.vo.OrderVO;

public interface OrderDAO {

	void orderInsert(OrderVO vo);

	List<OrderVO> getOrder(OrderVO vo);
	
	List<OrderVO> getOrderList(OrderVO ord);

	void orderInDateUpdate(OrderVO vo);

	List<OrderVO> getOrderNo(Map<String, Object> map);

	List<OrderVO> getDetail(OrderVO ord);

	void orderDel(OrderVO vo);

	int getTotal(Map<String, Object> map);

	void orderCancel(OrderVO vo);
}
