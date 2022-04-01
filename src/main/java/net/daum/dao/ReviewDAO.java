package net.daum.dao;

import java.util.List;

import net.daum.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(ReviewVO r);

	int getListCount(ReviewVO r);

	List<ReviewVO> getReviewList(ReviewVO r);

	ReviewVO getReviewCont(int r_no);

	void editReview(ReviewVO r);

	void delReview(int r_no);


}
