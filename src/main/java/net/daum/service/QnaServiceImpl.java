package net.daum.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.dao.QnaDAO;
import net.daum.utils.FileUtils;
import net.daum.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public void insertQna(QnaVO qi, MultipartHttpServletRequest multireq) {
		this.qnaDAO.insertQna(qi);

	//이미지 넣기
	List<Map<String, Object>> qnalist;
		
	try {
		qnalist = fileUtils.parseInsertFileInfo5(qi, multireq);
		for(int i=0; i<qnalist.size(); i++) {
			this.qnaDAO.qnaimgin(qnalist.get(i));
		}
	} catch (Exception e) {
		e.printStackTrace();
		}
	}

	//qna목록
	@Override
	public List<QnaVO> getlimaqna(QnaVO qi) {
		return this.qnaDAO.getqnali(qi);
	}
	
	//qna카운트
	@Override
	public int getQnaListCount(QnaVO qi) {
		return qnaDAO.getQnaListCount(qi);
	}
	
	//qna내용보기
	@Override
	public QnaVO getQnaCont(int q_no) {
		return this.qnaDAO.getQnaCont(q_no);
	}

	//qna수정
	@Override
	public void editQna(QnaVO qi, MultipartHttpServletRequest multireq) {
		this.qnaDAO.editQna(qi);
		
	//수정 이미지 넣기
	List<Map<String, Object>> qnalist;
	
	try {
		qnalist = fileUtils.parseInsertFileInfo5(qi, multireq);
		for(int i=0; i<qnalist.size(); i++) {
			this.qnaDAO.qnaimgedit(qnalist.get(i));
			}
		} catch (Exception e) {
		e.printStackTrace();
		}	
	}

	//qna답변
	@Override
	public void replyQna(QnaVO qi) {
		this.qnaDAO.updateLevel(qi); // 답변 레벨 증가
		this.qnaDAO.replyQna(qi); // 답변 저장
	}

	//qna삭제
	@Override
	public void delQna(int q_no) {
		this.qnaDAO.delQna(q_no);
	}
	
	
	
	//토탈qna카운트
	@Override
	public int getTotalQnaListCount(QnaVO qi) {
		return this.qnaDAO.getTotalQnaCount(qi);
	}
	
	//토탈qna목록
	@Override
	public List<QnaVO> getlitoqna(QnaVO qi) {
		return this.qnaDAO.getlitoqna(qi);
	}


}
