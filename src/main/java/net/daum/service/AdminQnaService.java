package net.daum.service;

import java.util.List;

import net.daum.vo.QnaVO;

public interface AdminQnaService {

	int getQnaCount(QnaVO q);

	List<QnaVO> getQnaList(QnaVO q);

	QnaVO getAdminQnaCont(int q_no);

	void replyAdminQna(QnaVO q);

	void editQna(QnaVO q);

	void delQna(int no);

}
