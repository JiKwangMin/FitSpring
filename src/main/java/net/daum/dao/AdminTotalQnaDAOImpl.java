package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.QnaVO;

@Repository
public class AdminTotalQnaDAOImpl implements AdminTotalQnaDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public int getAdminTotalListCount(QnaVO tq) {
		return this.sqlSession.selectOne("adToQna_row", tq);
	}

	@Override
	public List<QnaVO> getAdminTotalQnaList(QnaVO tq) {
		return this.sqlSession.selectList("adToQna_li", tq);

	}

	@Override
	public QnaVO getAdminTotalQnaCont(int q_no) {
		return this.sqlSession.selectOne("adToQna_co", q_no);

	}

	@Override
	public void AdmintotalUpdateLevel(QnaVO rq) {
		this.sqlSession.update("adToReply_up", rq);
		
	}

	@Override
	public void AdminTotalReplyQna(QnaVO rq) {
		this.sqlSession.insert("adToReply_in", rq);
		
	}

	@Override
	public void editAdminTotalQna(QnaVO eq) {
		this.sqlSession.update("adToQna_up", eq);
		
	}

	@Override
	public void delAdminTotalQna(int no) {
		this.sqlSession.delete("adToQna_del",no);
		
	}

	
}
