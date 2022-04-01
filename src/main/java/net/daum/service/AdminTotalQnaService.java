package net.daum.service;

import java.util.List;

import net.daum.vo.QnaVO;

public interface AdminTotalQnaService {

	int getAdminTotalListCount(QnaVO tq);

	List<QnaVO> getAdminTotalQnaList(QnaVO tq);

	QnaVO getAdminTotalQnaCont(int q_no);

	void AdminTotalReplyQna(QnaVO rq);

	void editAdminTotalQna(QnaVO eq);

	void delAdminTotalQna(int no);

	

}
