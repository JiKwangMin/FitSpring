package net.daum.dao;

import java.util.List;
import java.util.Map;

import net.daum.vo.CartVO;

public interface CartDAO {

	void cart(CartVO vo);

	int cartCheck(CartVO vo);

	List<CartVO> getList(CartVO vo);

	void cartDel(CartVO vo);

	void cartUpdate(CartVO vo);

	List<CartVO> getorderitem(Map<String, Object> map);

	void intotalprice(CartVO vo);

	List<CartVO> getCartList(CartVO cart);

}
