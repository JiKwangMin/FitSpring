package net.daum.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.AdminQnaService;
import net.daum.vo.QnaVO;

@Controller
public class AdminQnaController {

	@Autowired
	private AdminQnaService adminQnaService;
	
	// 관리자 qna 목록
	@RequestMapping("/admin_qna_list")
	public String admin_qna_list(Model listM, @ModelAttribute QnaVO q,
								HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();	
		HttpSession session=request.getSession();//세션 객체 생성
		String admin_id=(String)session.getAttribute("admin_id"); //세션 관리자 아이디를 구함
		
		// 관리자 로그인부분 if/else문 생략(나중에 작업)
		
		
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		
		String find_name=request.getParameter("find_name"); 
		String find_field=request.getParameter("find_field"); 
		q.setFind_field(find_field);
		q.setFind_name("%"+find_name+"%");
      
		int listcount = this.adminQnaService.getQnaCount(q);
		
		q.setStartrow((page-1)*10+1);//시작행번호
		q.setEndrow(q.getStartrow()+limit-1);//끝행번호
	
		List<QnaVO> qlist = this.adminQnaService.getQnaList(q);
		
		int maxpage=(int)((double)listcount/limit+0.95); 
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		listM.addAttribute("qlist",qlist);
		listM.addAttribute("page",page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
        listM.addAttribute("listcount",listcount);	
        listM.addAttribute("find_field",find_field);
        listM.addAttribute("find_name", find_name);
		
		return "admin/admin_qna_list";
	}
	
	// 수정폼, 답변폼, 삭제폼
	@RequestMapping("/admin_qna_cont")
	public ModelAndView admin_qna_cont(@RequestParam("no") int q_no, @RequestParam("state") String state,
						HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		
		// 관리자 로그인부분 if/else문 생략(나중에 작업)
		
		int page=1;
    	if(request.getParameter("page") != null) {
    		page=Integer.parseInt(request.getParameter("page"));
    	}
		QnaVO q = this.adminQnaService.getAdminQnaCont(q_no);
		String q_cont = q.getQ_cont().replace("\n", "<br/>");
		
		ModelAndView cm = new ModelAndView();
		cm.addObject("q", q);
		cm.addObject("q_cont", q_cont);
		cm.addObject("page", page);
		
		if(state.equals("cont")) {		// 내용
			cm.setViewName("admin/admin_qna_list");
		}else if(state.equals("reply")) { //답변폼일때
			cm.setViewName("admin/admin_qna_reply");
		}else if(state.equals("edit")) { //수정폼
			cm.setViewName("admin/admin_qna_edit");
		}
		return cm;
	}
	
	// admin 답변저장 + 레벨증가
	@RequestMapping("/admin_qna_reply_ok")
	public String admin_qna_relpy_ok(@ModelAttribute QnaVO q, HttpServletRequest request) throws Exception { 
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		this.adminQnaService.replyAdminQna(q);
		return "redirect:/admin_qna_list?page="+page;
	}
	
	// 수정완료
	@RequestMapping("/admin_qna_edit_ok")
	public String admin_qna_edit_ok(@ModelAttribute QnaVO q, HttpServletResponse response,
			HttpServletRequest request, HttpSession session, @RequestParam("page") int page) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		
		// 관리자 로그인부분 if/else문 생략(나중에 작업)
		
		this.adminQnaService.editQna(q);
		return "redirect:/admin_qna_list?page="+page;
	}
	
	// qna 삭제
	@RequestMapping("/admin_qna_del")
	public String admin_qna_del(@RequestParam("no") int no, @RequestParam("page") int page,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		
		// 관리자 로그인부분 if/else문 생략(나중에 작업)
		
		this.adminQnaService.delQna(no);
		return "redirect:/admin_qna_list?page="+page;
	}
}














