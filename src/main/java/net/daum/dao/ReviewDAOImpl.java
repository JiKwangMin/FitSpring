package net.daum.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession sqlSession;

	// 리뷰 작성
	@Override
	public void insertReview(ReviewVO ri) {
		this.sqlSession.insert("review_in",ri);
	}
	
	// 리뷰 이미지 넣기
	@Override
	public void reviewimgin(Map<String, Object> map) {
		sqlSession.insert("review_img_in",map);
	}
	
	// 총레코드개수
	@Override
	public int getReviewListCount(ReviewVO ri) {
		return this.sqlSession.selectOne("review_count",ri);
	}

	// 수정
	@Override
	public void editReview(ReviewVO ri) {
		this.sqlSession.update("review_up", ri);
	}
	// 이미지 수정
	@Override
	public void reviewimgedit(Map<String, Object> map) {
		this.sqlSession.update("review_img_up",map);	
	}
	
	// 삭제
	@Override
	public void delReview(int r_no) {
		this.sqlSession.delete("review_del1", r_no);
		this.sqlSession.delete("review_del2",r_no);
	}
	
	// 리뷰사진
	@Override
	public List<ReviewVO> mainreview(ReviewVO ri) {
		return sqlSession.selectList("reviewmain",ri);
	}

	// 리뷰목록
//	@Override
//	public List<ReviewVO> getReviewList(ReviewVO ri) {
//		return sqlSession.selectList("review_li", ri);
//	}
	// 리뷰목록
	@Override
	public List<ReviewVO> getmali(ReviewVO ri) {
		return sqlSession.selectList("mare", ri);
	}

	// 토탈리뷰 카운트
	@Override
	public int getPohtoListCount(ReviewVO ri) {
		return this.sqlSession.selectOne("totalreview_count", ri);
	}

	// 토탈리뷰 목록
	@Override
	public List<ReviewVO> getlitore(ReviewVO ri) {
		return sqlSession.selectList("matore", ri);
	}

	// 내용보기
	@Override
	public ReviewVO getReviewCont(int r_no) {
		return this.sqlSession.selectOne("r_cont", r_no);
	}

}