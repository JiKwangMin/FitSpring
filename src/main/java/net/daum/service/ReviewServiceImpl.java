package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.ReviewDAO;
import net.daum.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewVO r) {
		this.reviewDAO.insertReview(r);
		
	}

	@Override
	public int getListCount(ReviewVO r) {
		return this.reviewDAO.getListCount(r);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO r) {
		return this.reviewDAO.getReviewList(r);
	}

	@Override
	public ReviewVO getReviewCont(int r_no) {
		return this.reviewDAO.getReviewCont(r_no);
	}

	@Override
	public void editReview(ReviewVO r) {
		this.reviewDAO.editReview(r);
	}

	@Override
	public void delReview(int r_no) {
		this.reviewDAO.delReview(r_no);		
	}
}
