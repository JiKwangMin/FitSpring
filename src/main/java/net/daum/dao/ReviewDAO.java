package net.daum.dao;

import java.util.List;
import java.util.Map;

import net.daum.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(ReviewVO ri);

	void reviewimgin(Map<String, Object> map);
	
	int getReviewListCount(ReviewVO ri);
	
	//수정
	void editReview(ReviewVO ri);
	//이미지수정
	void reviewimgedit(Map<String, Object> map);
	//삭제
	void delReview(int r_no);

	List<ReviewVO> mainreview(ReviewVO ri);

	//List<ReviewVO> getReviewList(ReviewVO ri);

	List<ReviewVO> getmali(ReviewVO ri);

	int getPohtoListCount(ReviewVO ri);

	List<ReviewVO> getlitore(ReviewVO ri);

	ReviewVO getReviewCont(int r_no);

}
