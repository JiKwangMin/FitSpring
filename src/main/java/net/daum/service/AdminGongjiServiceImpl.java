package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.AdminGongjiDAO;
import net.daum.vo.GongjiVO;

@Service
public class AdminGongjiServiceImpl implements AdminGongjiService {

	@Autowired
	private AdminGongjiDAO adminGongjiDAO;

	@Override
	public int getListCount(GongjiVO g) {
		return this.adminGongjiDAO.getListCount(g);
	}

	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.adminGongjiDAO.getGongjiList(g);
	}

	@Override
	public void insertG(GongjiVO g) {
		this.adminGongjiDAO.insertG(g);		
	}

	@Override
	public GongjiVO getGongjiCont(int no) {
		return this.adminGongjiDAO.getGongjiCont(no);
	}

	@Override
	public void editGongji(GongjiVO g) {
		this.adminGongjiDAO.editGongji(g);		
	}

	@Override
	public void delG(int no) {
        this.adminGongjiDAO.delG(no);		
	}	
}









