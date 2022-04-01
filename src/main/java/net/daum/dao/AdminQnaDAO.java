package net.daum.dao;

import java.util.List;

import net.daum.vo.QnaVO;

public interface AdminQnaDAO {

	int getQnaCount(QnaVO q);

	List<QnaVO> getQnaList(QnaVO q);

	QnaVO getAdminQnaCont(int q_no);

	void updateLevel(QnaVO q);

	void replyAdminQna(QnaVO q);

	void editQna(QnaVO q);

	void delQna(int no);

}
