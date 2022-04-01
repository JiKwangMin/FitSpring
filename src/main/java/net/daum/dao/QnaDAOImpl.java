package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertQna(QnaVO q) {
		this.sqlSession.insert("qna_in",q);
	}//저장

	@Override
	public int getListCount(QnaVO q) {
		return this.sqlSession.selectOne("qna_row",q);
	}//총레코드 개수

	@Override
	public List<QnaVO> getQnaList(QnaVO q) {
		return this.sqlSession.selectList("qna_li", q);
	}//목록보기

	@Override
	public QnaVO getQnaCont(int q_no) {
		return this.sqlSession.selectOne("qna_co", q_no);
	}//내용보기
	
	@Override
	public void replyQna(QnaVO rq) {
		this.sqlSession.insert("reply_in", rq);
	} //답변저장

	@Override
	public void updateLevel(QnaVO rq) {
		this.sqlSession.update("reply_up", rq);
	} //답변레벨 증가

	@Override
	public void editQna(QnaVO eq) {
		this.sqlSession.update("qna_up", eq);
	} //qna수정

	@Override
	public void delQna(int q_no) {
		this.sqlSession.delete("qna_del",q_no);
	} //qna삭제

	
}
