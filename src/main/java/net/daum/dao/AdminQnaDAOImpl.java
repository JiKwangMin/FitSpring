package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.QnaVO;

@Repository
public class AdminQnaDAOImpl implements AdminQnaDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int getQnaCount(QnaVO q) {
		return this.sqlSession.selectOne("aq_count", q);
	} // 검색 전후 레코드 개수

	@Override
	public List<QnaVO> getQnaList(QnaVO q) {
		return this.sqlSession.selectList("aq_list",q);
	} // 검색전후 목록

	@Override
	public QnaVO getAdminQnaCont(int q_no) {
		return this.sqlSession.selectOne("aq_cont",q_no);
	}	// 답변,수정,삭제

	@Override
	public void updateLevel(QnaVO q) {
		this.sqlSession.update("aq_reply_up",q);
	} // 답변 레벨 증가

	@Override
	public void replyAdminQna(QnaVO q) {
		this.sqlSession.insert("aq_reply_in", q);
	} //답변 저장

	@Override
	public void editQna(QnaVO q) {
		this.sqlSession.update("aq_up",q);
	} // 수정

	@Override
	public void delQna(int no) {
		this.sqlSession.delete("aq_del", no);
	} // 삭제

	
	
	
}
