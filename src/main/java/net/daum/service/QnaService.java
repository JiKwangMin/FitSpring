package net.daum.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.vo.QnaVO;

public interface QnaService {

	//qna삽입
	void insertQna(QnaVO qi, MultipartHttpServletRequest multireq);

	//qna목록
	List<QnaVO> getlimaqna(QnaVO qi);

	//qna카운트
	int getQnaListCount(QnaVO qi);

	//qna정보
	QnaVO getQnaCont(int q_no);

	//qna수정
	void editQna(QnaVO qi, MultipartHttpServletRequest multireq);

	//qna답변
	void replyQna(QnaVO qi);

	//qna삭제
	void delQna(int q_no);

	
	
	//토탈qna카운트
	int getTotalQnaListCount(QnaVO qi);
	//토탈qna리스트
	List<QnaVO> getlitoqna(QnaVO qi);
	

}
 