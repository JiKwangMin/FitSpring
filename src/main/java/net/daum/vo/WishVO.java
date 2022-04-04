package net.daum.vo;

import lombok.Data;

@Data
public class WishVO {
	//WISHLIST TABLE
	private int wish_item_no;
	private String wish_mem_id;
	//join vo
	private ItemInfoVO itemInfoVO;
	
}
