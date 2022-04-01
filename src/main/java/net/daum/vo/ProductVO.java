package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class ProductVO {

	private int p_id;
	private String p_path;
	private String p_category1;
	private String p_category2;
	private String p_name;
	private String p_size;
	private String p_color;
	private int p_price;
	private String p_activition;
	private int p_stock;
	private int p_sell;
	private String p_date;
	
	private int startrow; //시작행번호
	private int endrow; //끝행번호
	
	private String find_name; //검색어
	private String find_field; //검색필드
}
