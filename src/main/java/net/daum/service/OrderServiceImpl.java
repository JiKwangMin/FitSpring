package net.daum.service;

import java.util.List;

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
	public OrderVO getOrder(OrderVO vo) {
		return this.dao.getOrder(vo);
	}

}
