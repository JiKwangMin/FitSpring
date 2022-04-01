package net.daum.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.AdminTotalQnaService;
import net.daum.vo.QnaVO;

@Controller
public class AdminTotalQnaController {

	@Autowired
	private AdminTotalQnaService adminTotalQnaService;
	
	// qna 목록
	@RequestMapping("/admin_total_qna_list")
	public ModelAndView admin_total_qna_list(@ModelAttribute QnaVO tq, HttpServletRequest request,HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();	
		HttpSession session=request.getSession();//세션 객체 생성
		String admin_id=(String)session.getAttribute("admin_id"); //세션 관리자 아이디를 구함
		
		// 관리자 로그인부분 if/else문 생략(나중에 작업)
		
		int page = 1;
		int limit = 5;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		
		tq.setFind_field(find_field);
		tq.setFind_name("%"+find_name+"%");
		
		int listcount=this.adminTotalQnaService.getAdminTotalListCount(tq);

		tq.setStartrow((page-1)*5+1);//시작행번호
		tq.setEndrow(tq.getStartrow()+limit-1);//끝행번호
		
		List<QnaVO> qlist=this.adminTotalQnaService.getAdminTotalQnaList(tq);
		
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=(((int)((double)page/5+0.9))-1)*5+1;
		int endpage=maxpage;
		if(endpage > startpage+5-1) endpage=startpage+5-1;

		ModelAndView listM = new ModelAndView();
		listM.addObject("qlist", qlist);
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
		listM.addObject("listcount",listcount);	
		listM.addObject("find_field",find_field);
		listM.addObject("find_name", find_name);
		
		listM.setViewName("admin/admin_total_qna_list");
		
		return listM;
	}
	
	// 수정폼, 답변폼, 삭제폼
	@RequestMapping("/admin_total_qna_cont")
	public ModelAndView admin_total_qna_cont(@RequestParam("no") int q_no, @RequestParam("state") String state,
			int page, @ModelAttribute QnaVO q, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		
		// 관리자 로그인부분 if/else문 생략(나중에 작업)
		
		q = this.adminTotalQnaService.getAdminTotalQnaCont(q_no);
		String q_cont = q.getQ_cont().replace("\n", "<br/>");
		
		ModelAndView m = new ModelAndView();
		m.addObject("q", q);
		m.addObject("q_cont",q_cont);
		m.addObject("page", page);
		
		if(state.equals("cont")) {
			m.setViewName("admin/admin_total_qna_list");
		}else if(state.equals("reply")) {//답변폼일때
			m.setViewName("admin/admin_total_qna_reply");
		}else if(state.equals("edit")) {//수정폼
			m.setViewName("admin/admin_total_qna_edit");
		}else if(state.equals("del")) {//삭제폼
			m.setViewName("admin/admin_total_qna_del");
		}
		return m;
	}
	// 답변저장 + 레벨증가
	@RequestMapping("admin_total_qna_reply_ok")
	public String admin_qna_reply_ok(@ModelAttribute QnaVO rq, HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		this.adminTotalQnaService.AdminTotalReplyQna(rq); // 답변저장 + 레벨증가		
		return "redirect:/admin_total_qna_list?page="+page; // 목록보기로 이동
	}
	
	// 수정완료
		@RequestMapping("admin_total_qna_edit_ok")
		public String admin_total_qna_edit_ok(@ModelAttribute QnaVO eq,HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			session=request.getSession();
			String admin_id=(String)session.getAttribute("admin_id");
			
			// 관리자 로그인부분 if/else문 생략(나중에 작업)

			int page=1;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			QnaVO db_pwd = this.adminTotalQnaService.getAdminTotalQnaCont(eq.getQ_no());
			
			if(!db_pwd.getQ_pwd().equals(eq.getQ_pwd())) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				this.adminTotalQnaService.editAdminTotalQna(eq); // 수정
				return "redirect:/admin_total_qna_list?no="+eq.getQ_no()+"&page="+page+"&state=list";
			}
			return null;
		}
		
		// qna 삭제
		@RequestMapping("/admin_total_qna_del")
		public String admin_total_qna_del(@RequestParam("no") int no, @RequestParam("page") int page,
				HttpServletResponse response, HttpServletRequest request) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
			String admin_id=(String)session.getAttribute("admin_id");
			
			// 관리자 로그인부분 if/else문 생략(나중에 작업)
			
			this.adminTotalQnaService.delAdminTotalQna(no);
			return "redirect:/admin_total_qna_list?page="+page;
		}
}

