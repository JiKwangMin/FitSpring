package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.AdminQnaDAO;
import net.daum.vo.QnaVO;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	private AdminQnaDAO adminQnaDAO;

	@Override
	public int getQnaCount(QnaVO q) {
		return this.adminQnaDAO.getQnaCount(q);
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO q) {
		
		return this.adminQnaDAO.getQnaList(q);
	}

	@Override
	public QnaVO getAdminQnaCont(int q_no) {
		return this.adminQnaDAO.getAdminQnaCont(q_no);
	}

	@Override
	public void replyAdminQna(QnaVO q) {
		this.adminQnaDAO.updateLevel(q); //답변레벨
		this.adminQnaDAO.replyAdminQna(q); //답변저장
	}

	@Override
	public void editQna(QnaVO q) {
		this.adminQnaDAO.editQna(q);
	}

	@Override
	public void delQna(int no) {
		this.adminQnaDAO.delQna(no);
		
	}
}
