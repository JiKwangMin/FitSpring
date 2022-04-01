package net.daum.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.ReviewService;
import net.daum.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	// 디테일 리뷰작성
	@RequestMapping("/review_write")
	public String review_write(HttpServletRequest request, Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		return "review/review_write";
	}
	
	// 디테일 리뷰저장
	@RequestMapping("/review_write_ok")
	public ModelAndView review_write_ok(@ModelAttribute ReviewVO r) {
		this.reviewService.insertReview(r); 
		return new ModelAndView("redirect:/item_detail1");
	}
	
	// 디테일 리뷰 목록
	@RequestMapping("/item_detail1")
	public ModelAndView detail_review(@ModelAttribute ReviewVO r, HttpServletRequest request) {
		int page = 1;
		int limit = 5;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = this.reviewService.getListCount(r);
		
		r.setStartrow((page-1)*5+1);//시작행번호
		r.setEndrow(r.getStartrow()+limit-1);//끝행번호
		
		List<ReviewVO> rlist = this.reviewService.getReviewList(r);

		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=(((int)((double)page/5+0.9))-1)*5+1;
		int endpage=maxpage;
		if(endpage > startpage+5-1) endpage=startpage+5-1;
		
		ModelAndView listM = new ModelAndView();
		listM.addObject("rlist", rlist);
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
		listM.addObject("listcount",listcount);	
		
		listM.setViewName("sub/item_detail");
		return listM;
	}
	
	// 수정폼, 삭제폼
	@RequestMapping("/review_cont")
	public ModelAndView review_cont(@RequestParam("no") int r_no, @RequestParam("state") String state, int page, @ModelAttribute ReviewVO r) {
		
		r = this.reviewService.getReviewCont(r_no);
		String r_cont = r.getR_cont().replace("\n", "<br/>");
		
		ModelAndView m = new ModelAndView();
		m.addObject("r", r);
		m.addObject("r_cont", r_cont);
		m.addObject("page", page);
		
		if(state.equals("cont")) {
			m.setViewName("sub/item_detail1");
		}else if(state.equals("edit")) {//수정폼
			m.setViewName("review/review_edit");
		}else if(state.equals("del")) {//삭제폼
			m.setViewName("review/review_del");
		}
		return m;
	}
	
	// 수정완료
	@RequestMapping("review_edit_ok")
	public String review_edit_ok(@ModelAttribute ReviewVO r,HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ReviewVO db_pwd = this.reviewService.getReviewCont(r.getR_no());
		
		if(!db_pwd.getR_pwd().equals(r.getR_pwd())) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			this.reviewService.editReview(r);
			return "redirect:/item_detail?no="+r.getR_no()+"&page="+page+"&state=list";
		}
		return null;
	}
	
	// 삭제
	@RequestMapping("/review_del_ok")
	public String review_del_ok(@RequestParam("r_no") int r_no, @RequestParam("del_pwd") String del_pwd,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		ReviewVO db_pwd = this.reviewService.getReviewCont(r_no);
		if(!db_pwd.getR_pwd().equals(del_pwd)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			this.reviewService.delReview(r_no);
			return "redirect:/item_detail?page="+page;
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
