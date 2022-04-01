package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.AdminTotalQnaDAO;
import net.daum.vo.QnaVO;

@Service
public class AdminTotalQnaServiceImpl implements AdminTotalQnaService {

	@Autowired
	private AdminTotalQnaDAO adminTotalQnaDAO;

	@Override
	public int getAdminTotalListCount(QnaVO tq) {
		return this.adminTotalQnaDAO.getAdminTotalListCount(tq);
	}

	@Override
	public List<QnaVO> getAdminTotalQnaList(QnaVO tq) {
		return this.adminTotalQnaDAO.getAdminTotalQnaList(tq);
	}

	@Override
	public QnaVO getAdminTotalQnaCont(int q_no) {
		return this.adminTotalQnaDAO.getAdminTotalQnaCont(q_no);
	}

	@Override
	public void AdminTotalReplyQna(QnaVO rq) {
		this.adminTotalQnaDAO.AdmintotalUpdateLevel(rq); //답변레벨
		this.adminTotalQnaDAO.AdminTotalReplyQna(rq); //답변저장
		
	}

	@Override
	public void editAdminTotalQna(QnaVO eq) {
		this.adminTotalQnaDAO.editAdminTotalQna(eq);
		
	}

	@Override
	public void delAdminTotalQna(int no) {
		this.adminTotalQnaDAO.delAdminTotalQna(no);
		
	}

	
}
