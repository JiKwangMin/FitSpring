package net.daum.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.CartDAO;
import net.daum.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO dao;

	@Override
	public void cart(CartVO vo) {
		this.dao.cart(vo);
	}

	@Override
	public int cartCheck(CartVO vo) {
		return this.dao.cartCheck(vo);
	}

	@Override
	public List<CartVO> getList(CartVO vo) {
		return this.dao.getList(vo);
	}

	@Override
	public void cartDel(CartVO vo) {
		this.dao.cartDel(vo);
	}

	@Override
	public void cartUpdate(CartVO vo) {
		this.dao.cartUpdate(vo);
	}

	@Override
	public List<CartVO> getorderitem(Map<String, Object> map) {
		return this.dao.getorderitem(map);
	}

	@Override
	public void intotalprice(CartVO vo) {
		this.dao.intotalprice(vo);
	}

	@Override
	public List<CartVO> getCartList(CartVO cart) {
		return this.dao.getCartList(cart);
	}

	@Override
	public void delPay(CartVO cv) {
		this.dao.delPay(cv);
	}

	@Override
	public int getCartNo(CartVO vo) {
		return this.dao.getCartNo(vo);
	}

	@Override
	public void direct(CartVO vo) {
		this.dao.direct(vo);
	}
}
