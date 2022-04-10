package net.daum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession sqlSession;

	//qna작성
	@Override
	public void insertQna(QnaVO qi) {
		this.sqlSession.insert("qna_in",qi);
		
	}
	
	//qna이미지삽입
	@Override
	public void qnaimgin(Map<String, Object> map) {
		this.sqlSession.insert("qna_img_in",map);
	}

	//qna목록
	@Override
	public List<QnaVO> getqnali(QnaVO qi) {
		return sqlSession.selectList("maqna", qi);
	}

	//qna카운트
	@Override
	public int getQnaListCount(QnaVO qi) {
		return sqlSession.selectOne("qna_count", qi);
	}

	//qna정보
	@Override
	public QnaVO getQnaCont(int q_no) {
		return this.sqlSession.selectOne("q_cont", q_no);
	}

	//qna수정
	@Override
	public void editQna(QnaVO qi) {
		this.sqlSession.update("qna_up",qi);
	}
	
	//qna이미지 수정
	@Override
	public void qnaimgedit(Map<String, Object> map) {
		this.sqlSession.update("qna_img_up",map);
		
	}

	//답변레벨증가
	@Override
	public void updateLevel(QnaVO qi) {
		this.sqlSession.update("reply_up1",qi);
		
	}

	//답변저장
	@Override
	public void replyQna(QnaVO qi) {
		this.sqlSession.insert("reply_in1", qi);
		
	}
	
	@Override
	public void delQna(int q_no) {
		this.sqlSession.delete("qna_del1",q_no);
		this.sqlSession.delete("qna_del2",q_no);
		
	}

	//토탈qna카운트
	@Override
	public int getTotalQnaCount(QnaVO qi) {
		return this.sqlSession.selectOne("totalqna_count",qi);
	}

	//토탈qna목록
	@Override
	public List<QnaVO> getlitoqna(QnaVO qi) {
		return sqlSession.selectList("matoqna", qi);
	}

	

	

	



}
