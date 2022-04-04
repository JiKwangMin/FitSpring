package net.daum.service;

import java.util.List;

import net.daum.vo.WishVO;

public interface WishListService {

	void wishInsert(WishVO wishVO);

	int wishCheck(WishVO wishVO);

	void wishDelete(WishVO wishVO);

	int listCnt(WishVO vo);

	List<WishVO> getlist(WishVO vo);

}
