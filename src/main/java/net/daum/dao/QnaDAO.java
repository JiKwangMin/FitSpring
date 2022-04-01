package net.daum.dao;

import java.util.List;

import net.daum.vo.QnaVO;

public interface QnaDAO {

	void insertQna(QnaVO q);

	int getListCount(QnaVO q);

	List<QnaVO> getQnaList(QnaVO q);
	
	QnaVO getQnaCont(int q_no);

	void replyQna(QnaVO rq);

	void updateLevel(QnaVO rq);

	void editQna(QnaVO eq);

	void delQna(int q_no);



	

}
