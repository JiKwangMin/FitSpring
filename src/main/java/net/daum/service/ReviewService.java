package net.daum.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.vo.ReviewVO;

public interface ReviewService {
	
	//리뷰저장
	void insertReview(ReviewVO ri, MultipartHttpServletRequest multireq);
	
	//리뷰카운트
	int getReviewListCount(ReviewVO ri);
	
	//수정
	void editReview(ReviewVO ri, MultipartHttpServletRequest multireq);
	
	//삭제
	void delReview(int r_no);

	//리뷰사진
	List<ReviewVO> getmainreview(ReviewVO ri);

	//리뷰목록
	List<ReviewVO> getlimare(ReviewVO ri);

	//토탈리뷰 카운트
	int getPohtoListCount(ReviewVO ri);
	
	//토탈리뷰 목록
	List<ReviewVO> getlitore(ReviewVO ri);

	//내용보기
	ReviewVO getReviewCont(int r_no);


}
