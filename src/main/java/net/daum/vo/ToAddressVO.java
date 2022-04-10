package net.daum.vo;

import lombok.Data;

@Data
public class ToAddressVO {
	
	private int to_addr_no;
	private String mem_id;
	private String to_name;
	private String to_post;
	private String to_addr;
	private String to_detailaddr;
	private String to_phone;
	private String to_message;
	private String defaultaddress;
}
