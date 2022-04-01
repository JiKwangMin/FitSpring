package net.daum.dao;

import java.util.List;

import net.daum.vo.QnaVO;

public interface AdminTotalQnaDAO {

	int getAdminTotalListCount(QnaVO tq);

	List<QnaVO> getAdminTotalQnaList(QnaVO tq);

	QnaVO getAdminTotalQnaCont(int q_no);

	void AdmintotalUpdateLevel(QnaVO rq);

	void AdminTotalReplyQna(QnaVO rq);

	void editAdminTotalQna(QnaVO eq);

	void delAdminTotalQna(int no);

	

}
