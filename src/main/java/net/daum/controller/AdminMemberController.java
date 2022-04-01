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

import net.daum.service.AdminMemberService;
import net.daum.vo.MemberVO;
import pwdconv.PwdChange;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;

	//관리자 회원목록
	@RequestMapping("/admin_member_list")
	public String admin_member_list(Model listM,
			HttpServletResponse response,
			HttpServletRequest request,
			@ModelAttribute MemberVO m)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		//관리자 세션 아이디를 구함

		if(admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			int page=1;//쪽번호
			int limit=7;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			m.setFind_field(find_field);
			m.setMem_name("%"+find_name+"%");
			//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
			//매핑 대응

			int listcount=this.adminMemberService.getListCount(m);
			//전체 레코드 개수 또는 검색전후 레코드 개수
			//System.out.println("총 게시물수:"+listcount+"개");

			m.setStartrow((page-1)*7+1);//시작행번호
			m.setEndrow(m.getStartrow()+limit-1);//끝행번호

			List<MemberVO> blist=
					this.adminMemberService.getMemberList(m);
			//검색 전후 회원목록

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			listM.addAttribute("blist",blist);
			//blist 키이름에 값 저장
			listM.addAttribute("page",page);
			listM.addAttribute("startpage",startpage);
			listM.addAttribute("endpage",endpage);
			listM.addAttribute("maxpage",maxpage);
			listM.addAttribute("listcount",listcount);	
			listM.addAttribute("find_field",find_field);
			listM.addAttribute("find_name", find_name);

			return "admin/admin_member_list";
			//뷰페이지 폴더경로와 파일명 지정	
		}
		return null;
	}//admin_member_list()

	//회원 상세정보+수정폼
	@RequestMapping("/admin_member_info")
	public String admin_member_info(
			@RequestParam("mem_id") String mem_id,
			@RequestParam("state") String state,
			HttpServletRequest request,
			HttpServletResponse response,
			Model am) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");

		if(admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));    		
			}
			MemberVO m=this.adminMemberService.getMem(mem_id);//회원정보
			//를 디비로 부터 가져온다.
			String del_cont=null;
			if(m.getMem_delcont() != null) {//탈퇴 사유가 있는 경우
				del_cont=m.getMem_delcont().replace("\n","<br/>");
				//textarea 영역에서 엔터키 친부분을 다음줄로 줄바꿈
			}
			String[] phone= {"010","011","019"};
			String[] email= {"naver.com","daum.net","nate.com",
					"google.com","직접입력"};
			am.addAttribute("phone",phone);
			am.addAttribute("email", email);
			am.addAttribute("m",m); am.addAttribute("del_cont",del_cont);
			am.addAttribute("page",page);

			if(state.equals("info")) {//상세정보 보기
				return "admin/admin_member_info";
			}else if(state.equals("edit")) {//수정폼
				return "admin/admin_member_edit";
			}
		}
		return null;
	}//admin_member_info()

	//관리자 회원관리 정보수정
	@RequestMapping("/admin_member_edit")
	public String admin_member_edit(
			MemberVO m,HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			m.setMem_pw(PwdChange.getPassWordToXEMD5String(
					m.getMem_pw()));//비번을 암호화
			this.adminMemberService.editM(m);//회원정보수정
			/*문제풀이) 1.아이디를 기준으로 비번,이름,우편번호,주소,나머지
			 * 주소,멜,폰번호,mem_state,mem_delcont를 수정되게 한다. 	 
			 */
			out.println("<script>");
			out.println("alert('정보 수정했습니다!');");
			out.println("location='admin_member_info?state=edit"
					+"&mem_id="+m.getMem_id()+"';");
			out.println("</script>");
		}
		return null;
	}//admin_member_edit()

	//관리자 회원탈퇴
	@RequestMapping("/admin_member_del")
	public ModelAndView admin_member_del(
			@RequestParam("mem_id") String mem_id,
			HttpServletResponse response,
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));    		
			}
			this.adminMemberService.delM(mem_id);//회원삭제
			/* 문제풀이) 아이디를 기준으로 회원을 delete한다.     	
			 */
			return     	
					new ModelAndView(
							"redirect:/admin_member_list").addObject("page",page); 
			//admin_member_list?page=쪽번호 get방식으로 회원목록으로 이동
		}
		return null;
	}//admin_member_del()
}



































































