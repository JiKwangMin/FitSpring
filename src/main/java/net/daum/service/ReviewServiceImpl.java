package net.daum.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.dao.ReviewDAO;
import net.daum.utils.FileUtils;
import net.daum.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewVO ri, MultipartHttpServletRequest multireq) {
		this.reviewDAO.insertReview(ri);
		
		//이미지 넣기
		List<Map<String, Object>> reviewlist;
		
		try {
			reviewlist = fileUtils.parseInsertFileInfo3(ri, multireq);
			for(int i=0; i<reviewlist.size(); i++) {
				this.reviewDAO.reviewimgin(reviewlist.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//카운트
	@Override
	public int getReviewListCount(ReviewVO ri) {
		return this.reviewDAO.getReviewListCount(ri);
	}

	//수정
	@Override
	public void editReview(ReviewVO ri, MultipartHttpServletRequest multireq) {
		this.reviewDAO.editReview(ri);
		
		
		//수정 이미지 넣기 
		List<Map<String, Object>> reviewlist;
			
		try {
			reviewlist = fileUtils.parseInsertFileInfo3(ri, multireq);
			
			for(int i=0; i<reviewlist.size(); i++) {
				this.reviewDAO.reviewimgedit(reviewlist.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//삭제
	@Override
	public void delReview(int r_no) {
		this.reviewDAO.delReview(r_no);		
	}

	//리뷰사진
	@Override
	public List<ReviewVO> getmainreview(ReviewVO ri) {
		return this.reviewDAO.mainreview(ri);
	}

	//리뷰목록
	@Override
	public List<ReviewVO> getlimare(ReviewVO ri) {
		return this.reviewDAO.getmali(ri);
	}
	
	//토탈리뷰카운트
	@Override
	public int getPohtoListCount(ReviewVO ri) {
		return this.reviewDAO.getPohtoListCount(ri);
	}
	
	//토탈리뷰 목록
	@Override
	public List<ReviewVO> getlitore(ReviewVO ri) {
		return this.reviewDAO.getlitore(ri);
	}

	//내용보기
	@Override
	public ReviewVO getReviewCont(int r_no) {
		return this.reviewDAO.getReviewCont(r_no);
	}



}
