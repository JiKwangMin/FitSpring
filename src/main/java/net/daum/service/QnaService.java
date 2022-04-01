package net.daum.service;

import java.util.List;

import net.daum.vo.QnaVO;

public interface QnaService {

	void insertQna(QnaVO q);

	int getListCount(QnaVO q);

	List<QnaVO> getQnaList(QnaVO q);
	
	QnaVO getQnaCont(int q_no);

	void replyQna(QnaVO rq);

	void editQna(QnaVO eq);

	void delQna(int q_no);

	

	

}
