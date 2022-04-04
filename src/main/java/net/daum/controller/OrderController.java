package net.daum.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.daum.service.CartService;
import net.daum.service.MemberService;
import net.daum.vo.CartVO;

@Controller
public class OrderController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/order")
	public String direct_order() {
		return "direct/order";
	}//바로구매
	
	@RequestMapping("/cart/order")
	public String cart_order(Model model,HttpSession session, HttpServletRequest request) {
		String login_id = (String)session.getAttribute("id");
		//회원 정보
//		List<MemberVO> memberlist = this.memberService.getMemberinfo(member);
		//카트 정보
		CartVO vo = new CartVO();
		vo.setCart_mem_id(login_id);
		String cart_no = request.getParameter("cart_no");
		String[] no = cart_no.split(",");
		Map<String,Object> map = new HashMap<>();
		for(int i=0;i<no.length;i++) {
			map.put("cart",Integer.parseInt(no[i]));
		}
		System.out.println(map);
		cartService.getorderitem(map);
		model.addAttribute("orderitem",vo);
		return "normal/cart-order";
	}
	
	@RequestMapping("/order_completed")
	public String order_completed() {
		return "normal/order_completed";
	}//주문성공
}
