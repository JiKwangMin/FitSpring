 package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.daum.service.ReviewService;
import net.daum.vo.ItemInfoVO;
import net.daum.vo.ReviewVO;

@Controller
public class PhotoController {

	@Autowired
	private ReviewService reviewService;
	

	
	// total Review 목록
	@RequestMapping("/photo")
	public String photo(Model model,ReviewVO ri,HttpServletRequest request, HttpSession hs) throws Exception {
		model.addAttribute("login_id",hs.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
	int page = 1; int limit = 6;
	if(request.getParameter("page") != null) {
		  page =Integer.parseInt(request.getParameter("page")); 
	}
			  
	int listcount = this.reviewService.getPohtoListCount(ri);
	ri.setStartrow((page-1)*6+1);//시작행번호
	ri.setEndrow(ri.getStartrow()+limit-1);//끝행번호
		
	int maxpage=(int)((double)listcount/limit+0.95); 
	int startpage=(((int)((double)page/6+0.9))-1)*6+1;
	int endpage=maxpage;
	if(endpage > startpage+6-1) endpage=startpage+6-1;
	
	
	//리뷰가 뿌려질때 정보 + 사진 이 r_no 묶여잇음
	List<ReviewVO> litore = this.reviewService.getlitore(ri);
	
	
	model.addAttribute("litore", litore);
	model.addAttribute("page",page);
	model.addAttribute("startpage",startpage);
	model.addAttribute("endpage",endpage);
	model.addAttribute("maxpage",maxpage);
	model.addAttribute("listcount",listcount);
	return "photo/photo";
	}
}
