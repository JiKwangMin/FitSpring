package net.daum.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.OrderDAO;
import net.daum.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO dao;

	@Override
	public void orderInsert(OrderVO vo) {
		this.dao.orderInsert(vo);
	}

	@Override
	public List<OrderVO> getOrder(OrderVO vo) {
		return this.dao.getOrder(vo);
	}
	
	@Override
	public List<OrderVO> getOrderList(OrderVO ord) {
		return this.dao.getOrderList(ord);
	}

	@Override
	public void orderInDateUpdate(OrderVO vo) {
		this.dao.orderInDateUpdate(vo);
	}

	@Override
	public List<OrderVO> getOrderNo(Map<String, Object> map) {
		return this.dao.getOrderNo(map);
	}

	@Override
	public List<OrderVO> getDetail(OrderVO ord) {
		return this.dao.getDetail(ord);
	}

	@Override
	public void orderDel(OrderVO vo) {
		this.dao.orderDel(vo);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.dao.getTotal(map);
	}

	@Override
	public void orderCancel(OrderVO vo) {
		this.dao.orderCancel(vo);
	}
}
