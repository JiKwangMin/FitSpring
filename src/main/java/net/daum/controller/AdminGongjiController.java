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

import net.daum.service.AdminGongjiService;
import net.daum.vo.GongjiVO;

@Controller
public class AdminGongjiController {

	@Autowired
	private AdminGongjiService adminGongjiService;
	
	//관리자 공지목록
	@RequestMapping("/admin_gongji_list")
	public String admin_gongji_list(
			@ModelAttribute GongjiVO g,
			Model listM,
			HttpServletRequest request,
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
        	int page=1;//쪽번호
    		int limit=7;//한페이지에 보여지는 목록개수
    		if(request.getParameter("page") != null) {
    page=Integer.parseInt(request.getParameter("page"));			
    		}
    String find_name=request.getParameter("find_name");//검색어
    String find_field=request.getParameter("find_field");//검색
    //필드
          g.setFind_field(find_field);
          g.setFind_name("%"+find_name+"%");
          //%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
          //매핑 대응
          
           int listcount=
        		   this.adminGongjiService.getListCount(g);
    		//전체 레코드 개수 또는 검색전후 레코드 개수
    		//System.out.println("총 게시물수:"+listcount+"개");
    		
    		g.setStartrow((page-1)*7+1);//시작행번호
    		g.setEndrow(g.getStartrow()+limit-1);//끝행번호
    		
    		List<GongjiVO> glist=
    				this.adminGongjiService.getGongjiList(g);
    		//목록
    		
    		//총페이지수
    		int maxpage=(int)((double)listcount/limit+0.95);
    		//현재 페이지에 보여질 시작페이지 수(1,11,21)
    		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
    		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
    		int endpage=maxpage;
    		if(endpage > startpage+10-1) endpage=startpage+10-1;
    		
    		listM.addAttribute("glist",glist);
    		//glist 키이름에 값 저장
    		listM.addAttribute("page",page);
    		listM.addAttribute("startpage",startpage);
    		listM.addAttribute("endpage",endpage);
    		listM.addAttribute("maxpage",maxpage);
            listM.addAttribute("listcount",listcount);	
            listM.addAttribute("find_field",find_field);
            listM.addAttribute("find_name", find_name);
           
    		return "admin/admin_gongji_list";
    		//뷰페이지 폴더경로와 파일명 지정	
        }
		return null;
	}//admin_gongji_list()
	
	//관리자 공지작성
	@RequestMapping("/admin_gongji_write")
	public ModelAndView admin_gongji_write(Model m,
			HttpServletRequest request,
			HttpServletResponse response)
	throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
String admin_id=(String)session.getAttribute("admin_id");
       if(admin_id==null) {
    	   out.println("<script>");
    	   out.println("alert('다시 로그인 하세요!');");
    	   out.println("location='admin_index';");
    	   out.println("</script>");
       }else {
    	   int page=1;
if(request.getParameter("page") != null) {
	page=Integer.parseInt(request.getParameter("page"));
}
m.addAttribute("page",page);
ModelAndView gw=new ModelAndView("admin/admin_gongji_write");
return gw;
       }
		return null;
	}//admin_gongji_write()
	
	 //관리자 공지저장
	@RequestMapping("/admin_gongji_write_ok")
	public String admin_gongji_write_ok(GongjiVO g,
			HttpServletRequest request,
			HttpServletResponse response)
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
    	this.adminGongjiService.insertG(g);//공지 저장
    	return "redirect:/admin_gongji_list";
    	//관리자 공지 목록으로 이동
    }
		return null;
	}
	
	//관리자 공지 수정과 상세정보
	@RequestMapping("/admin_gongji_cont")
	public String admin_gongji_cont(Model cm,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("no") int no,
			@RequestParam("state") String state)
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
	GongjiVO g=this.adminGongjiService.getGongjiCont(no);
	String g_cont=g.getGongji_cont().replace("\n","<br/>");
	//textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈
	
	cm.addAttribute("g",g);
	cm.addAttribute("g_cont",g_cont);
	cm.addAttribute("page",page);
	
	if(state.equals("cont")) {//내용보기
		return "admin/admin_gongji_cont";
	}else if(state.equals("edit")) {//수정폼
		return "admin/admin_gongji_edit";
	}
}
		return null;
	}//admin_gongji_cont()
	
	//관리자 공지 수정완료
	@RequestMapping("/admin_gongji_edit_ok")
	public ModelAndView admin_gongji_edit_ok(GongjiVO g,
			HttpServletRequest request,
			HttpServletResponse response)
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
this.adminGongjiService.editGongji(g);//공지 수정
return 
new ModelAndView("redirect:/admin_gongji_list?page="+page);
        }
		return null;
	}//admin_gongji_edit_ok()
	
	//관리자 공지 삭제
	@RequestMapping("/admin_gongji_del")
	public String admin_gongji_del(
			@RequestParam("no") int no,
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
	this.adminGongjiService.delG(no);//공지 삭제
	
	return "redirect:/admin_gongji_list?page="+page;
}
	return null;
	}//admin_gongji_del()
}





































