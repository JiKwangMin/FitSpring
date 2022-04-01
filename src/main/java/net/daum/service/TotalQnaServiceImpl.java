package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.TotalQnaDAO;
import net.daum.vo.QnaVO;

@Service
public class TotalQnaServiceImpl implements TotalQnaService {

	@Autowired
	private TotalQnaDAO totalQnaDAO;

	@Override
	public int getTotalListCount(QnaVO q) {
		return this.totalQnaDAO.getTotalListCount(q);
	}

	@Override
	public List<QnaVO> getTotalQnaList(QnaVO q) {
		return this.totalQnaDAO.getTotalQnaList(q);
	}

	@Override
	public QnaVO getTotalQnaCont(int q_no) {
		return this.totalQnaDAO.getTotalQnaCont(q_no);
	}

	@Override
	public void TotalReplyQna(QnaVO rq) {
		this.totalQnaDAO.totalUpdateLevel(rq); //답변레벨
		this.totalQnaDAO.totalReplyQna(rq); //답변저장
		
	}

	@Override
	public void editTotalQna(QnaVO eq) {
		this.totalQnaDAO.totalEditQna(eq);
		
	}

	@Override
	public void delTotalQna(int q_no) {
		this.totalQnaDAO.totalDelQna(q_no);
		
	}
}
