package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemInfoVO {
	
	//ITEM_INFO TABLE
	private int item_no;
	private String item_co1;
	private String item_co2;
	private String item_name;
	private int item_price;
	private String item_cont;
	private String item_write_date;
	
	
	//ITEM_MAIN_IMG TABLE
	private int main_file_no;
	private String main_item_img;
	private String main_item_origin_name;
	
	//ITEM_SUB_IMG_TABLE
	private int sub_file_no;
	private String sub_item_img;
	private String sub_item_origin_name;
	
	//ITEM_OPTION TABLE
	private int option_item_no;
	private String option_val1;//제품정보
	private int option_val2;//제품수량
	private int selcount;//판매수량
	private int real_selcount;
	
	//page
	private int startrow;
	private int endrow;
	
	//ITEM_BANNER TABLE
	private int banner_file_no;
	private String banner_item_img;
	private String banner_origin_name;
	
	//비교연산용
	private int temp;
}
