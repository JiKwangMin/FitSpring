package net.daum.controller;

import java.util.ArrayList;
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
import net.daum.service.MemberService;
import net.daum.service.OrderService;
import net.daum.vo.CartVO;
import net.daum.vo.MemberVO;
import net.daum.vo.OrderVO;

@Controller
public class OrderController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/order")
	public String direct_order() {
		return "direct/order";
	}//바로구매
	
	
	@RequestMapping("/cart/order")
	public String cart_order(Model model,HttpSession session, HttpServletRequest request) {
		//선택된 번호에 해당하는 상품정보 -> 구매자정보아이디만 카트 (이름 이메일 휴대폰번호 ), 받는사람정보는 일단 저장된거없음.(이름,배송주소,연락처 + 배송요청사항 )  ,( member테이블에 이름,이메일,휴대폰번호,배송주소,우편번호 ) 1
		// 카트테이블에 총가격이 있음 // 총토탈가격도 1번
		//(상품 이름/옵션/수량) 2번반복되는거 <-- {orderitem} -> forEach로 따로놈 
		
		/*
		 * 2개 List 필요
		 * 1. MEM_NAME, MEM_ADDRESS + MEM_DETAILADDRESS, MEM_OADDRESS, MEM_PHONE
		 * 2. carttable where 선택된 번호 
		 */
			
		String login_id = (String)session.getAttribute("id");
		
		MemberVO mm = new MemberVO();
		mm.setMem_id(login_id);
		mm = this.memberService.getCartInfo(mm);
		
		
		
		//선택된 상품넘버
		String cart_no = request.getParameter("cart_no");
		String[] no = cart_no.split(",");
		
		//ArrayList에 이 값들이 저장됨.
		ArrayList<String> no1 = new ArrayList<>();
		for(String temp:no) {
			no1.add(temp);
		}
		
		List<List<CartVO>> list3 = new ArrayList<>();
		
		
		for(int i=0; i<no1.size(); i++) {
			CartVO cart = new CartVO();
			int cart_no2 = Integer.parseInt(no1.get(i));
			
			cart.setCart_no(cart_no2);
			List<CartVO> list2 = this.cartService.getCartList(cart);
			System.out.println(list2.get(0));
			System.out.println(list2.get(0).getCart_item_no());
			System.out.println(list2.get(0).getCart_no());
			
			list3.add(list2);
		}
		
		
		//총 가격 구하기
		model.addAttribute("mm",mm);
		model.addAttribute("point",Integer.parseInt(list3.get(0).get(0).getSubtotal())/100);
		model.addAttribute("subtotal",list3.get(0).get(0).getSubtotal());
		model.addAttribute("orderitem", list3);
		return "normal/cart-order";
	}
	
	@ResponseBody
	@RequestMapping("/order/orderInsert")
	public int orderInsert(HttpServletRequest request) {
		int data = 0;
		OrderVO vo = new OrderVO();
		try {
			System.out.println("=========주문 등록=========");
			vo.setOrder_no(request.getParameter("order_no"));
			System.out.println(vo.getOrder_no());
			vo.setOrder_mem_id(request.getParameter("order_mem_id"));
			System.out.println(vo.getOrder_mem_id());
			vo.setOrder_name(request.getParameter("order_name"));
			System.out.println(vo.getOrder_name());
			vo.setOrder_addr(request.getParameter("order_addr"));
			System.out.println(vo.getOrder_addr());
			vo.setOrder_post(request.getParameter("order_post"));
			System.out.println(vo.getOrder_post());
			vo.setOrder_phone(request.getParameter("order_phone"));
			System.out.println(vo.getOrder_phone());
			vo.setOrder_message(request.getParameter("order_message"));
			System.out.println(vo.getOrder_message());
			vo.setOrder_use_point(Integer.parseInt(request.getParameter("order_use_point")));
			System.out.println(vo.getOrder_use_point());
			vo.setOrder_paytype(request.getParameter("order_paytype"));
			System.out.println(vo.getOrder_paytype());
			vo.setOrder_total_price(Integer.parseInt(request.getParameter("order_total_price")));
			System.out.println(vo.getOrder_total_price());
			String[] order_item_no = request.getParameterValues("order_item_no");
			String[] order_item_name = request.getParameterValues("order_item_name");
			String[] order_option_no = request.getParameterValues("order_option_no");
			String[] order_option_val = request.getParameterValues("order_option_val");
			String[] order_item_qty = request.getParameterValues("order_item_qty");
			String[] order_item_price = request.getParameterValues("order_item_price");
			int size = order_option_no.length;
			for(int i=0;i<size;i++) {
				vo.setOrder_item_no(Integer.parseInt(order_item_no[i]));
				System.out.println(vo.getOrder_item_no());
				vo.setOrder_item_name(order_item_name[i]);
				System.out.println(vo.getOrder_item_name());
				vo.setOrder_option_no(Integer.parseInt(order_option_no[i]));
				System.out.println(vo.getOrder_option_no());
				vo.setOrder_option_val(order_option_val[i]);
				System.out.println(vo.getOrder_option_val());
				vo.setOrder_item_qty(Integer.parseInt(order_item_qty[i]));
				System.out.println(vo.getOrder_item_qty());
				vo.setOrder_item_price(Integer.parseInt(order_item_price[i]));
				System.out.println(vo.getOrder_item_price());
				orderService.orderInsert(vo);
			}
			data = 1;
		}catch(Exception e) {
			e.printStackTrace();
			data = 2;
		}
			
		System.out.println(data);
		return data;
	}
	
	@RequestMapping("/order_completed")
	public String order_completed(HttpServletRequest request,Model model) {
		OrderVO vo = new OrderVO();
		String onum = request.getParameter("order_no");
		vo.setOrder_no(onum);
		System.out.println(vo.getOrder_no());
		vo = this.orderService.getOrder(vo);
		if(vo.getOrder_no() != null) {
			model.addAttribute("vo", vo);
		}
		return "normal/order_completed";
	}//주문성공
}
