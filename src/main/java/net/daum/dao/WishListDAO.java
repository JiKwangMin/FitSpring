package net.daum.dao;

import java.util.List;

import net.daum.vo.WishVO;

public interface WishListDAO {

	void wishInsert(WishVO wishVO);

	int wishCheck(WishVO wishVO);

	void wishDelete(WishVO wishVO);

	int listCnt(WishVO vo);

	List<WishVO> getList(WishVO vo);

}
