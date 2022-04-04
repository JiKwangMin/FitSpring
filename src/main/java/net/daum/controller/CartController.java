package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.daum.service.CartService;
import net.daum.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/cart")
	public String cart(HttpSession session,Model model,CartVO vo) {
		String id = (String)session.getAttribute("id");
		vo.setCart_mem_id(id);
		//장바구니 리스트
		List<CartVO> cartlist = this.cartService.getList(vo);
		System.out.println(cartlist);
		model.addAttribute("cartlist", cartlist);
		return "normal/cart";
	}
	
	@ResponseBody
	@RequestMapping("/cart/add")//장바구니 상품 등록
	public int cartAdd(HttpSession session,HttpServletRequest request) {
		String id = (String)session.getAttribute("id");
		CartVO vo = new CartVO();
		int result = 0;
		vo.setCart_mem_id(id);
		vo.setCart_item_no(Integer.parseInt(request.getParameter("cart_item_no")));
		vo.setCart_item_name(request.getParameter("cart_item_name"));
		vo.setCart_item_price(Integer.parseInt(request.getParameter("cart_item_price")));
		String[] cart_option_no = request.getParameterValues("cart_option_no");
		String[] cart_option_val = request.getParameterValues("cart_option_val");
		String[] cart_sc = request.getParameterValues("cart_sc");
		int size = cart_option_no.length;
		
		
		if(id != null) {//세션 아이디 값이 있어야 등록 가능함
			if(cartService.cartCheck(vo) == 0) {
				for(int i=0; i<size;i++) {
					System.out.println("cart_option_no["+i+"]"+cart_option_no[i]);
					System.out.println("cart_sc["+i+"]"+cart_sc[i]);
					vo.setCart_option_no(Integer.parseInt(cart_option_no[i]));
					vo.setCart_option_val(cart_option_val[i]);
					vo.setCart_sc(Integer.parseInt(cart_sc[i]));
					cartService.cart(vo);
				}
				result = 1;
			}else {
				result = 2;
			}
		}
		System.out.println(result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/cart/update")//수량 변경
	public int cartUpdate(CartVO vo) {
		int result = 0;
		try {
			cartService.cartUpdate(vo);
			result = 1;
			System.out.println("선택된 수량으로 변경되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			result = 2;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/cart/del")
	public int cartDel(CartVO vo){
		int result = 0;
		try {
			cartService.cartDel(vo);
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
			result = 2;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/cart/chkDel")
	public int cartChkDel(HttpSession session,@RequestParam(value = "option_no[]") List<String> cartArr,CartVO vo) {
		int result = 0;
		vo.setCart_mem_id((String)session.getAttribute("id"));
		try {
			for(String i : cartArr) {
				System.out.print(i+",");
				vo.setCart_option_no(Integer.parseInt(i));
				cartService.cartDel(vo);
			}
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
			result = 2;
		}
		
		return result;
	}
}
