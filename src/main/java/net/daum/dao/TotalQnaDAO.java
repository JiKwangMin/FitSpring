package net.daum.dao;

import java.util.List;

import net.daum.vo.QnaVO;

public interface TotalQnaDAO {

	int getTotalListCount(QnaVO q);

	List<QnaVO> getTotalQnaList(QnaVO q);

	QnaVO getTotalQnaCont(int q_no);

	void totalUpdateLevel(QnaVO rq);

	void totalReplyQna(QnaVO rq);

	void totalEditQna(QnaVO eq);

	void totalDelQna(int q_no);

}
