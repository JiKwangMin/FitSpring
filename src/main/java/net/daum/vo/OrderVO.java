package net.daum.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private String order_no;			//주문번호
	private String order_mem_id;		//회원 아이디
	private int order_item_no;			//상품 pk
	private int order_option_no;		//상품 옵션 pk
	private String order_option_val;	//상품 옵션 정보
	private String order_item_name;		//상품 이름
	private int order_item_qty;			//상품 수량
	private int order_item_price;		//상품 가격
	private int order_delivery_charge;	//배송비
	private String order_addr;			//받는분 주소
	private String order_post;			//받는분 우편번호
	private String order_name;			//받는분 이름
	private String order_phone;			//받는분 전화번호
	private String order_message;		//받는분 요청사항
	private int order_use_point;		//회원 사용 포인트
	private String order_use_cpn_name;	//사용 쿠폰 이름
	private int order_use_cpn;			//사용 쿠폰 value
	private String order_paytype;		//결제 타입
	private int order_total_price;		//할인이 적용된 총 금액
	private Date order_date;			//주문 날짜
	private int order_state;			//주문 상태
	private int order_delivery_state;	//배송 상태
}
