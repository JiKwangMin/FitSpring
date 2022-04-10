package net.daum.utils;

import org.springframework.stereotype.Component;

import lombok.Getter;
import net.daum.vo.PageVO;

@Component
@Getter
public class Paging {
	
	private int pageCount;//페이징 개수
	private int startPage;//페이지 시작번호
	private int endPage;//페이지 끝번호
	private int realEnd;
	private boolean prev, next;
	private int total;
	private PageVO page;
	
	public Paging() {}
	
	public Paging(int total,PageVO page,int pageCount) {
		this.total = total;
		this.page = page;
		this.pageCount = pageCount;
		
		this.endPage = (int) (Math.ceil(page.getPageNum() / (double) pageCount) * pageCount);
		this.startPage = (this.endPage-pageCount) +1;
		
		realEnd = (int)(Math.ceil(total*1.0 / page.getAmount()));
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd == 0 ? 1 : realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
