package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertReview(ReviewVO r) {
		this.sqlSession.insert("review_in",r);
	}

	@Override
	public int getListCount(ReviewVO r) {
		return this.sqlSession.selectOne("review_row",r);
	} //총레코드 개수

	@Override
	public List<ReviewVO> getReviewList(ReviewVO r) {
		return this.sqlSession.selectList("review_li",r);
	} //목록보기

	@Override
	public ReviewVO getReviewCont(int r_no) {
		return this.sqlSession.selectOne("review_co", r_no);
	} //내용보기

	@Override
	public void editReview(ReviewVO r) {
		this.sqlSession.update("review_up", r);
	} //수정

	@Override
	public void delReview(int r_no) {
		this.sqlSession.delete("review_del", r_no);
	} //삭제


	
	
}
