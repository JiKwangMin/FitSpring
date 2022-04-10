package net.daum.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.daum.service.AdminService;
import net.daum.service.CartService;
import net.daum.service.MemberService;
import net.daum.service.OrderService;
import net.daum.vo.CartVO;
import net.daum.vo.ItemInfoVO;
import net.daum.vo.MemberVO;
import net.daum.vo.OrderVO;
import net.daum.vo.ToAddressVO;

@Controller
public class OrderController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AdminService adminService;
	
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
		//배송지 불러오기
		ToAddressVO address = new ToAddressVO();
		address.setMem_id(login_id);
		address = this.memberService.getAddress(address);
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
		model.addAttribute("ad",address);
		model.addAttribute("login_id",login_id);
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
		ItemInfoVO ii = new ItemInfoVO();
		CartVO cv = new CartVO();
		
		//재고, 판매수 등록 -> order_option_no = option_item_no, order_item_qty = temp ItemInfoVO
		//카트 비우기 -> order_option_no = cart_option_no, order_mem_id = cart_mem_id CartVO
		String[] order_option_no1 = request.getParameterValues("order_option_no");
		String[] order_item_qty1 = request.getParameterValues("order_item_qty");
		cv.setCart_mem_id(request.getParameter("order_mem_id"));
				
		//selcount, real_selcount 받아서 계산
		int temp = 0;
		int temp01 = 0;
		int temp02 = 0;
				
		for(int i=0; i<order_option_no1.length; i++) {
			ii.setOption_item_no(Integer.parseInt(order_option_no1[i]));
			cv.setCart_option_no(Integer.parseInt(order_option_no1[i]));
					
			temp = (Integer.parseInt(order_item_qty1[i]));
					
			ii = this.adminService.getPp(ii);
			int real_selcount = ii.getReal_selcount();
			int selcount = ii.getSelcount();
					
			int real_selcount1 = real_selcount + temp;
			int selcount1 = selcount + temp;
					
			ii.setReal_selcount(real_selcount1);
			ii.setSelcount(selcount1);
					
			this.adminService.updatePay(ii);
			this.cartService.delPay(cv);
			}
		//포인트 차감 + 적립
		int delpoint = Integer.parseInt(request.getParameter("order_use_point"));
		int plusepoint = (Integer.parseInt(request.getParameter("order_total_price"))) / 100 ;
		String mem_id = request.getParameter("order_mem_id");
		int point = this.memberService.getPoint(mem_id);
				
		System.out.println("==========================================================");
		System.out.println(delpoint);
		System.out.println(plusepoint);
		System.out.println(point);
		System.out.println("==========================================================");
		MemberVO mm = new MemberVO();
		mm.setMem_id(mem_id);
		if(delpoint > plusepoint) {
			//사용한 포인트가 더 크면 temp11만큼 포인트 차감 
			int temp10 = delpoint - plusepoint;
			int temp11 = point - temp10;
			mm.setTemp11(temp11);
			System.out.println(temp11);
					
			this.memberService.mp(mm);
		}else if(delpoint < plusepoint) {
			//적립금이 더 높으면 temp11만큼 포인트 적립
			int temp10 = plusepoint - delpoint;
			int temp11 = temp10 + point;
			System.out.println("+ : "+ temp11);
			mm.setTemp11(temp11);
			this.memberService.mp(mm);
		}
		
		try {
			System.out.println("=========주문 등록=========");
			vo.setOrder_no(request.getParameter("order_no"));
			vo.setOrder_mem_id(request.getParameter("order_mem_id"));
			vo.setOrder_name(request.getParameter("order_name"));
			vo.setOrder_addr(request.getParameter("order_addr"));
			vo.setOrder_post(request.getParameter("order_post"));
			vo.setOrder_phone(request.getParameter("order_phone"));
			vo.setOrder_message(request.getParameter("order_message"));
			vo.setOrder_use_point(Integer.parseInt(request.getParameter("order_use_point")));
			vo.setOrder_paytype(request.getParameter("order_paytype"));
			vo.setOrder_total_price(Integer.parseInt(request.getParameter("order_total_price")));
			vo.setOrder_subtotal_price(Integer.parseInt(request.getParameter("order_subtotal_price")));
			String[] order_item_no = request.getParameterValues("order_item_no");
			String[] order_item_name = request.getParameterValues("order_item_name");
			String[] order_option_no = request.getParameterValues("order_option_no");
			String[] order_option_val = request.getParameterValues("order_option_val");
			String[] order_item_qty = request.getParameterValues("order_item_qty");
			String[] order_item_price = request.getParameterValues("order_item_price");
			int size = order_option_no.length;
			for(int i=0;i<size;i++) {
				vo.setOrder_item_no(Integer.parseInt(order_item_no[i]));
				vo.setOrder_item_name(order_item_name[i]);
				vo.setOrder_option_no(Integer.parseInt(order_option_no[i]));
				vo.setOrder_option_val(order_option_val[i]);
				vo.setOrder_item_qty(Integer.parseInt(order_item_qty[i]));
				vo.setOrder_item_price(Integer.parseInt(order_item_price[i]));
				orderService.orderInsert(vo);
			}
			//반복문을 통한 1개씩 등록이라 날짜값이 0.01초 오차 발생 오차를 없애기 위한 날짜 업데이트
			orderService.orderInDateUpdate(vo);
			data = 1;
		}catch(Exception e) {
			e.printStackTrace();
			data = 2;
		}
		
		return data;
	}
	
	@RequestMapping("/order_completed")
	public String order_completed(HttpSession session,HttpServletRequest request,Model model) {
		String login_id = (String)session.getAttribute("id");
		OrderVO vo = new OrderVO();
		String onum = request.getParameter("order_no");
		vo.setOrder_no(onum);
		if(vo.getOrder_no() != null) {
			List<OrderVO> list = this.orderService.getOrder(vo);
			model.addAttribute("vo", list.get(0));
		}
		model.addAttribute("login_id",login_id);
		return "normal/order_completed";
	}//주문성공
}
