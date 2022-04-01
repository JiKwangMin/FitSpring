package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.QnaDAO;
import net.daum.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public void insertQna(QnaVO q) {
		this.qnaDAO.insertQna(q);
		
	}

	@Override
	public int getListCount(QnaVO q) {
		return this.qnaDAO.getListCount(q);
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO q) {
		return this.qnaDAO.getQnaList(q);
	}
	
	@Override
	public QnaVO getQnaCont(int q_no) {
		return this.qnaDAO.getQnaCont(q_no);
	}
	
	@Override
	public void replyQna(QnaVO rq) {
		this.qnaDAO.updateLevel(rq); // 답변 레벨 증가
		this.qnaDAO.replyQna(rq); // 답변 저장
	}

	@Override
	public void editQna(QnaVO eq) {
		this.qnaDAO.editQna(eq); // 수정
		
	}

	@Override
	public void delQna(int q_no) {
		this.qnaDAO.delQna(q_no);
		
	}

	
}
