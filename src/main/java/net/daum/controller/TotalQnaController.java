package net.daum.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.service.AdminService;
import net.daum.service.MemberService;
import net.daum.service.QnaService;
import net.daum.vo.ItemInfoVO;
import net.daum.vo.QnaVO;

@Controller
public class TotalQnaController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private MemberService memberService;
	
	//total qna 목록
	@RequestMapping("/total_qna_list")
	public String totalqna(Model model, QnaVO qi, HttpServletRequest request, HttpSession hs) throws Exception {
		model.addAttribute("login_id",hs.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		int page1 = 1; int limit1 = 8;
		if(request.getParameter("page1") != null) {
			  page1 =Integer.parseInt(request.getParameter("page1")); 
		}
		
		int listcount = this.qnaService.getTotalQnaListCount(qi);
		qi.setStartrow1((page1-1)*8+1);//시작행번호
		qi.setEndrow1(qi.getStartrow1()+limit1-1);//끝행번호
			
		int maxpage1=(int)((double)listcount/limit1+0.95); 
		int startpage1=(((int)((double)page1/8+0.9))-1)*8+1;
		int endpage1=maxpage1;
		if(endpage1 > startpage1+8-1) endpage1=startpage1+8-1;
		
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		
		qi.setFind_field(find_field);
		qi.setFind_name("%"+find_name+"%");

		
		//qna가 뿌려질때 정보 + 사진
		List<QnaVO> litoqna = this.qnaService.getlitoqna(qi);
	
		model.addAttribute("qi", qi);
		model.addAttribute("litoqna", litoqna);
		model.addAttribute("page1",page1);
		model.addAttribute("startpage1",startpage1);
		model.addAttribute("endpage1",endpage1);
		model.addAttribute("maxpage1",maxpage1);
		model.addAttribute("listcount",listcount);
		model.addAttribute("find_field",find_field);
		model.addAttribute("find_name", find_name);
		
		
		return "/qna/total_qna_list";
	}
	//qna 수정
	@RequestMapping("TotalQnaEdit")
	public String TotalQnaEdit(Model model, HttpServletRequest request, HttpSession hs, QnaVO qi, @RequestParam("q_no")int q_no) {
		model.addAttribute("login_id",hs.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//qna리스트출력
		qi=this.qnaService.getQnaCont(q_no);
		
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		int page1=1;
		if(request.getParameter("page1") != null) {
			page1=Integer.parseInt(request.getParameter("page1"));
		}
		model.addAttribute("item_no", item_no);
		model.addAttribute("mem_id", (String)hs.getAttribute("id"));
		model.addAttribute("qi",qi);
		model.addAttribute("q_no", q_no);
		model.addAttribute("page1", page1);		
			
			return "/qna/total_qna_edit";
		}
			
		// qna수정완료
		@RequestMapping("/total_qna_edit_OK")
		public String total_qna_edit_OK(QnaVO qi, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multireq) throws Exception {
			
			String mem_pw = this.memberService.qfindpw(qi);
			
			if(!mem_pw.equals(qi.getQ_pwd())) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.flush();
			
				return null;
			} else if(mem_pw.equals(qi.getQ_pwd())) {
				
				this.qnaService.editQna(qi,multireq);
			
			return "redirect:/total_qna_list";
			}
			
			return null;
		}
	
	//qna 답변폼
	@RequestMapping("TotalQnaReply")
	public String TotalQnaReply(Model model,HttpServletRequest request, HttpSession hs, QnaVO qi, @RequestParam("q_no")int q_no) {
		//로그인아이디
		model.addAttribute("login_id",hs.getAttribute("id"));
		//세션유지
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		qi = this.qnaService.getQnaCont(q_no);
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		int page1=1;
		if(request.getParameter("page1") != null) {
			page1=Integer.parseInt(request.getParameter("page1"));
		}
		model.addAttribute("item_no", item_no);
		model.addAttribute("mem_id", (String)hs.getAttribute("id"));
		model.addAttribute("qi",qi);
		model.addAttribute("q_no", q_no);
		model.addAttribute("page1", page1);	
		
	
		return "/qna/total_qna_reply";
	}
	
	//답변저장+레벨증가
	@RequestMapping("total_qna_reply_OK")
	public String total_qna_reply_OK(QnaVO qi, HttpServletRequest request,HttpServletResponse response) throws Exception{
				  
		//회원 비번
		String mem_pw = this.memberService.qfindpw(qi);
		String mem_id = this.memberService.qfindid(qi);
		
		if(!mem_pw.equals(qi.getQ_pwd())) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		
			return null;
		} else if(mem_pw.equals(qi.getQ_pwd())) {
			qnaService.replyQna(qi);
			return "redirect:/total_qna_list";
		} else if(mem_id.equals("aaaaaaa") && mem_pw.equals("aaaaaaa")) {
			qnaService.replyQna(qi);
			return "redirect:/total_qna_list";
		}
		return null;
	}
	
	// 삭제
	@RequestMapping("/TotalQnaDel")
	public String TotalQnaDel(Model model, HttpServletRequest request, HttpSession hs, QnaVO qi)throws Exception {
		
		model.addAttribute("login_id",hs.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		int page1=1;
		if(request.getParameter("page1") != null) {
			page1=Integer.parseInt(request.getParameter("page1"));
		}

		int q_no = Integer.parseInt(request.getParameter("q_no"));
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		qi=this.qnaService.getQnaCont(q_no);
		
		model.addAttribute("qi", qi);
		model.addAttribute("item_no", item_no);
		model.addAttribute("mem_id", (String)hs.getAttribute("id"));
		model.addAttribute("q_no",q_no);
		model.addAttribute("page1", page1);
		
		return "/qna/total_qna_del";	
	}
	
	// 삭제완료
	@RequestMapping("/total_qna_del_OK")
	public String total_qna_del_OK(QnaVO qi, @RequestParam(value="q_no")int q_no, @RequestParam("item_no")int item_no,
			@RequestParam("del_pwd")String del_pwd, HttpServletResponse response) throws Exception {
		
		String mem_pw = this.memberService.qfindpw(qi);
		String mem_id = this.memberService.qfindid(qi);
		
		if(!mem_pw.equals(del_pwd)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			
			return null;
		} else if(mem_pw.equals(del_pwd)) {
			this.qnaService.delQna(q_no);
			return "redirect:/total_qna_list";
		} else if(mem_id.equals("aaaaaaa") && del_pwd.equals("aaaaaaa")) {
			this.qnaService.delQna(q_no);
			return "redirect:/total_qna_list";
		}
	return null;
	}
	
}


