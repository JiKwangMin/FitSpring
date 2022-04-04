package net.daum.vo;

import lombok.Data;

@Data
public class CartVO {
	//CART TABLE
	private int cart_no;//장바구니 번호
	private String cart_mem_id;//회원 아이디
	private int cart_item_no;//상품 번호
	private String cart_item_name;//상품 이름
	private int cart_item_price;//상품 금액
	private int cart_option_no;//상품 옵션 번호
	private String cart_option_val;//상품 옵션 이름
	private int cart_sc;//담는 수량
	private String subtotal;
	
	//join VO
	private ItemInfoVO itemInfoVO;
}
