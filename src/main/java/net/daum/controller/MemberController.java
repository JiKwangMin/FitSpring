package net.daum.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.AdminService;
import net.daum.service.MemberService;
import net.daum.service.WishListService;
import net.daum.vo.ItemInfoVO;
import net.daum.vo.MemberVO;
import net.daum.vo.WishVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private WishListService wishService;
	
	//메인
	@RequestMapping("/index")
	public ModelAndView index(HttpSession hs, ItemInfoVO ii) {
		hs.getAttribute("id");
		System.out.println("=================================");
		System.out.println(" id : " + (String)hs.getAttribute("id"));
		System.out.println("=================================");
		
		//배너 불러오기
		List<ItemInfoVO> balist = this.adminservice.gettotal(ii);
		//best상품 불러오기 8개
		List<ItemInfoVO> bestMainlist = this.adminservice.mabalist(ii);
		
		//최신상품 불러오기 12개
		//가격 이름 사진 1개 
		List<ItemInfoVO> newMainlist = this.adminservice.newmalist(ii);
		
		
		
		ModelAndView list = new ModelAndView();
		list.addObject("login_id",hs.getAttribute("id"));
		try {
			list.addObject("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		list.addObject("newMainlist", newMainlist);
		list.addObject("bestMainlist", bestMainlist);
		list.addObject("balist", balist);
		list.setViewName("index");
		
		return list; //뷰페이지 즉 뷰리졸브 경로가 /WEB-INF/views/member/member_login.jsp
	}//index()
	
	//사용자 회원관리 로그인 폼
	@RequestMapping("/member_login")
	public ModelAndView member_login() {
		return new ModelAndView("member/member_login"); //뷰페이지 즉 뷰리졸브 경로가 /WEB-INF/views/member/member_login.jsp
	}//member_login()
	
	
	//사용자 회원가입 폼
	@RequestMapping("member_join")
	public ModelAndView member_join() {
		ModelAndView m=new ModelAndView();
		m.setViewName("member/member_join"); 
		return m;
	}//member_join()
	
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public String idCheck(@RequestParam("mem_id") String mem_id) throws Exception{
		
		try {
			int count = memberService.idCheck(mem_id);
		}catch(Exception e) {
		String result = "one";
		return result;
	}
		String result = "zero";
		return result;
	}
	

	@RequestMapping(value = "/memberjoinpro", method = RequestMethod.POST)
	public String memberJoinPro(MemberVO vo) {
		memberService.memberJoinProcess(vo);
		return "member/member_login";
	}
	
// 아이디 찾기 페이지로 이동
	@RequestMapping(value="id_find")
	public String id_findView() {
		return "member/id_find";
	}
	@RequestMapping("findId")
	public String id_fidekkk(HttpServletRequest request, MemberVO vo, HttpServletResponse response, Model list)throws Exception{
		//네임 이메일 아이디
		
		String mem_name = request.getParameter("name");
		String mem_email = request.getParameter("email");
		
		 vo.setMem_email(mem_email); vo.setMem_name(mem_name);
		
		
		
		try {
			//있으면
		vo = this.memberService.findid(vo);
		list.addAttribute("mem_email", vo.getMem_email());
		list.addAttribute("mem_name", vo.getMem_name());
		int index = vo.getMem_id().length()-1; // 이게 전체 길이가됨
		String reidform = vo.getMem_id().substring(index-2).replaceAll("[A-Za-z0-9_\\-]", "*");
		String stidform = vo.getMem_id().substring(0,index-2);
		String reformid = stidform + reidform ;
		list.addAttribute("mem_id", reformid);
		return "member/id_find";
		}catch(Exception e) {
			//비밀번호 없으면 
			e.printStackTrace();
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("opener.parent.location.reload();");
			out.println("alert('회원정보가 없습니다');");
			out.println("window.close();");
			out.println("</script>");
			out.flush();
			
			return null;
		}	
	}
	
    // 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="pwd_find")
	public String p_findView() {
		return "member/pwd_find";
	}
	
 
	
	@RequestMapping("pwd_find1_ok")
	public String pwd_fidekkk(HttpServletRequest request, MemberVO vo, HttpServletResponse response, Model list)throws Exception{
		//네임 이메일 아이디
		
		String mem_name = request.getParameter("name");
		String mem_email = request.getParameter("email");
		String mem_id = request.getParameter("member_id");
		
		vo.setMem_id(mem_id); vo.setMem_email(mem_email); vo.setMem_name(mem_name);
		
		
		
		try {
			//있으면
		vo = this.memberService.findpw(vo);
		list.addAttribute("mem_id", vo.getMem_id());
		list.addAttribute("mem_email", vo.getMem_email());
		list.addAttribute("mem_name", vo.getMem_name());
		
		return "member/pwd_find_ok";
		}catch(Exception e) {
			//비밀번호 없으면 
			e.printStackTrace();
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("opener.parent.location.reload();");
			out.println("alert('회원정보가 없습니다');");
			out.println("window.close();");
			out.println("</script>");
			out.flush();
			
			return null;
		}
		
	}
	
	@RequestMapping("member_login_ok")
	public String member_login_ok(Model list,@RequestParam("mem_id") String mem_id,@RequestParam("mem_pw") String mem_pw, HttpServletResponse response,HttpSession session,MemberVO m) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		
		
		if(mem_id == "" || mem_id==null) {
			out.println("<script>");
			out.println("alert('아이디를 입력해주세요.')");
			out.println("</script>");
			
			return "redirect:/member_login";
		}else if(mem_pw == "" || mem_pw == null) {
			out.println("<script>");
			out.println("alert('비밀번호를 입력해주세요.')");
			out.println("</script>");
			
			return "redirect:/member_login";
		}else {
		
			m.setMem_id(mem_id);
			
			String userin_pw = mem_pw;
			System.out.println(" dddd : "+ userin_pw);
			String mem_pw_real = null;
			try {
			
				m = this.memberService.loginCheck(m);//가입회원 1 이고 해당 아이디가 있는 경우만 로그인 인증, 탈퇴회원 2는 로그인 못함.
				
				mem_pw_real = m.getMem_pw();
				
				//비밀번호만 가져왔음 없으면 아이디도 없으면 null
				//있으면 아이디 정보 있으니까 비밀번호 가져왔음.
			
				if(userin_pw.equals(mem_pw_real)) {//비번이 같으면
					System.out.println("========================");
					System.out.println("session_id : "+session.getId());
					System.out.println("mem_pw1 : "+mem_pw_real);
					System.out.println("========================");
					session.setAttribute("id",mem_id);
					session.setAttribute("rank", m.getMem_rank());
					return "redirect:/index";
				}else {//비번 틀리면
					
					out.println("<script>");
					out.println("alert('비번이 다릅니다!');");
					out.println("</script>");
					
					return "redirect:/member_login";
				}
			}catch(Exception e) {
				//null인 경우 아이디 없음

				out.println("<script>");
				out.println("alert('가입 안된 회원입니다!');");
				out.println("</script>");
				
				return "redirect:/member_login";
			}
		
		
		}
		
		
		
	}//member_login_ok()
	
	
	//로그아웃
	@RequestMapping("/member_logout")
	public String member_logout(HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		session.invalidate();//세션 만료
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("</script>");
		
		return "redirect:/index";
	}//member_logout()
	
	@RequestMapping("/mypage")
	public String mypage_test() {
		return "member/mypage";
	}
	
	@RequestMapping("/mypage_order")
	public String mypage_order() {
		return "member/mypage_order";
	}
	
	@RequestMapping("/mypage_order_detail")
	public String mypage_order_detail() {
		return "member/mypage_order_detail";
	}
	
	@RequestMapping("/mypage_wish")
	public String mypage_wish(HttpSession session,WishVO vo,Model model) {
		vo.setWish_mem_id((String)session.getAttribute("id"));
		//찜 상품 개수
		int cnt = wishService.listCnt(vo);
		
		model.addAttribute("cnt",cnt);
		model.addAttribute("wishlist",wishService.getlist(vo));
		return "member/mypage_wish";
	}
	
	@ResponseBody
	@RequestMapping("/mypage_wish/chkDelete")
	public int wish_chk_del(HttpSession session,@RequestParam(value = "item_no[]") List<String> itemArr, WishVO wishVO)throws Exception {
		int item_no = 0;
		try {
			wishVO.setWish_mem_id((String)session.getAttribute("id"));
			for(String i : itemArr) {
				System.out.println(i);
				item_no = Integer.parseInt(i);
				wishVO.setWish_item_no(item_no);
				wishService.wishDelete(wishVO);
			}
		}catch(Exception e){
			e.printStackTrace();
			return 2;
		}
		
		return 1;
	}
	
	@RequestMapping("/mypage_info")
	public String mypage_info() {
		return "member/mypage_info";
	}
	
	@RequestMapping("/mypage_info_login")
	public String mypage_info_ok() {
		return "member/mypage_info_login";
	}
	
	@RequestMapping("/mypage_address")
	public String mypage_address() {
		return "member/mypage_address";
	}
	
	@RequestMapping("/address/new")
	public String address_new() {
		return "address/address_new";
	}
	
	@RequestMapping("/addressbook/edit")
	public String address_edit() {
		return "address/address_edit";
	}
}
	
	
	






















