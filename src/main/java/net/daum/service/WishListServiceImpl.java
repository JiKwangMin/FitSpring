package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.WishListDAO;
import net.daum.vo.WishVO;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	public WishListDAO dao;

	@Override
	public void wishInsert(WishVO wishVO) {
		this.dao.wishInsert(wishVO);
	}

	@Override
	public int wishCheck(WishVO wishVO) {
		return this.dao.wishCheck(wishVO);
	}

	@Override
	public void wishDelete(WishVO wishVO) {
		this.dao.wishDelete(wishVO);
	}

	@Override
	public int listCnt(WishVO vo) {
		return this.dao.listCnt(vo);
	}

	@Override
	public List<WishVO> getlist(WishVO vo) {
		return this.dao.getList(vo);
	}
}
