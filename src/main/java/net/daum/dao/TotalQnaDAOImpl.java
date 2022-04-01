package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.QnaVO;

@Repository
public class TotalQnaDAOImpl implements TotalQnaDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int getTotalListCount(QnaVO q) {
		return this.sqlSession.selectOne("toQna_row", q);
	}

	@Override
	public List<QnaVO> getTotalQnaList(QnaVO q) {
		return this.sqlSession.selectList("toQna_li", q);
	}

	@Override
	public QnaVO getTotalQnaCont(int q_no) {
		return this.sqlSession.selectOne("toQna_co", q_no);
	}

	@Override
	public void totalUpdateLevel(QnaVO rq) {
		this.sqlSession.update("toReply_up", rq);
	}

	@Override
	public void totalReplyQna(QnaVO rq) {
		this.sqlSession.insert("toReply_in", rq);
		
	}

	@Override
	public void totalEditQna(QnaVO eq) {
		this.sqlSession.update("toQna_up", eq);
		
	}

	@Override
	public void totalDelQna(int q_no) {
		this.sqlSession.delete("toQna_del", q_no);
		
	}
}
