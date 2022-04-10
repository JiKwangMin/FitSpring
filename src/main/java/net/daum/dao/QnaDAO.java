package net.daum.dao;

import java.util.List;
import java.util.Map;

import net.daum.vo.QnaVO;

public interface QnaDAO {

	void insertQna(QnaVO qi);

	void qnaimgin(Map<String, Object> map);

	List<QnaVO> getqnali(QnaVO qi);

	int getQnaListCount(QnaVO qi);

	QnaVO getQnaCont(int q_no);

	void editQna(QnaVO qi);
	
	void qnaimgedit(Map<String, Object> map);

	void updateLevel(QnaVO qi);

	void replyQna(QnaVO qi);
	
	void delQna(int q_no);

	int getTotalQnaCount(QnaVO qi);

	List<QnaVO> getlitoqna(QnaVO qi);

	

	


}
