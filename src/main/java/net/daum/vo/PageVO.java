package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {
	
	private int pageNum;//페이지 번호
	private int amount;//페이지에 보여질 목록 개수
	
	public PageVO() {
		this(1,10);
	}
	
	public PageVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
