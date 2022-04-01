package net.daum.service;

import java.util.List;

import net.daum.vo.QnaVO;

public interface TotalQnaService {

	int getTotalListCount(QnaVO q);

	List<QnaVO> getTotalQnaList(QnaVO q);

	QnaVO getTotalQnaCont(int q_no);

	void TotalReplyQna(QnaVO rq);

	void editTotalQna(QnaVO eq);

	void delTotalQna(int q_no);

}
