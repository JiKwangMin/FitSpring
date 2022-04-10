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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.service.AdminService;
import net.daum.service.MemberService;
import net.daum.service.QnaService;
import net.daum.service.ReviewService;
import net.daum.service.WishListService;
import net.daum.vo.ItemInfoVO;
import net.daum.vo.QnaVO;
import net.daum.vo.ReviewVO;
import net.daum.vo.WishVO;

@Controller
public class SubController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private WishListService wishService;

	@RequestMapping("/Best")
	public String BestTOP() {
		return "sub/Best";
	}
	
	@RequestMapping("/item")
	public String sub_item(Model model, ItemInfoVO ii, @RequestParam("sortation")String sortation,@RequestParam("bsortation")String bsortation,HttpSession session) {
		//sortation= 구분
		//top끝
		System.out.println(sortation);
		List<ItemInfoVO> lilist = this.adminService.getManList(sortation);
		
		
		String title = "";
		if(sortation.equals("mentomen")) {
			title="맨투맨/후드";
		}else if(sortation.equals("knit")) {
			title="니트";
		}else if(sortation.equals("shirts")) {
			title="셔츠";
		}else if(sortation.equals("muji")) {
			title="무지티";
		}else if(sortation.equals("coat")) {
			title="코트";
		}else if(sortation.equals("cardigan")) {
			title="가디건";
		}else if(sortation.equals("jumper")) {
			title="점퍼";
		}else if(sortation.equals("jacket")) {
			title="자켓";
		}else if(sortation.equals("pants")) {
			title="기본 바지";
		}else if(sortation.equals("shorts")) {
			title="반바지";
		}else if(sortation.equals("denim")) {
			title="데님";
		}else if(sortation.equals("slippers")) {
			title="슬리퍼";
		}else if(sortation.equals("loafers")) {
			title="로퍼";
		}else if(sortation.equals("sneakers")) {
			title="스니커즈";
		}else if(sortation.equals("bag")) {
			title="가방";
		}else if(sortation.equals("hat")) {
			title="모자";
		}
		
		model.addAttribute("login_id",session.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) session.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("bsortation",bsortation);
		model.addAttribute("lilist", lilist);
		model.addAttribute("title",title);
		return "sub/item";
	}
	
	@RequestMapping("/item_detail")
	public String sub_item_detail(Model model, ItemInfoVO ii,@RequestParam("item_no")int item_no,
			ReviewVO ri,HttpServletRequest request, HttpSession session, QnaVO qi)throws Exception {
		
		ii.setItem_no(item_no);
		//메인사진리스트
		List<ItemInfoVO> mainlist = this.adminService.getmainview(ii);
		//서브사진리스트
		List<ItemInfoVO> sublist = this.adminService.getsubview(ii);
		//옵션리스트
		List<ItemInfoVO> optionlist = this.adminService.getoption(ii);
		//상품 기본 정보
		ii = this.adminService.getinfo(ii);
		String item_cont = ii.getItem_cont().trim().replace("\n","<br/>");
		int point = ii.getItem_price() / 100 ;
		//옵션 개수
		int option_total = this.adminService.getOption_total(ii);
		//찜 체크
		String id = (String)session.getAttribute("id");
		if(id != null) {
			WishVO wishVO = new WishVO();
			wishVO.setWish_item_no(item_no);
			wishVO.setWish_mem_id((String)session.getAttribute("id"));
			int wish_check = this.wishService.wishCheck(wishVO);
			model.addAttribute("wish_check", wish_check);
			model.addAttribute("id",id);
		}
		model.addAttribute("login_id",id);
		model.addAttribute("option_total", option_total);
		model.addAttribute("point", point);
		model.addAttribute("item_cont", item_cont);
		model.addAttribute("ii",ii);
		model.addAttribute("mainlist",mainlist);
		model.addAttribute("sublist",sublist);
		model.addAttribute("optionlist", optionlist);
		
		// 리뷰목록 // (review테이블 내용 + 리뷰에 첫번째사진 ) + 리뷰들사진 
		int page = 1; int limit = 6;
		if(request.getParameter("page") != null) {
		  page =Integer.parseInt(request.getParameter("page")); 
			}
		
		ri.setItem_no(item_no);
		int listcount = this.reviewService.getReviewListCount(ri);
		ri.setStartrow((page-1)*6+1);//시작행번호
		ri.setEndrow(ri.getStartrow()+limit-1);//끝행번호
		  
		//리뷰가 뿌려질때 정보 + 사진 이 r_no 묶여잇음
		List<ReviewVO> limare = this.reviewService.getlimare(ri);
		  
		int maxpage=(int)((double)listcount/limit+0.95); 
		int startpage=(((int)((double)page/6+0.9))-1)*6+1;
		int endpage=maxpage;
		if(endpage > startpage+6-1) endpage=startpage+6-1;
		
		model.addAttribute("limare", limare);
		model.addAttribute("page",page);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("maxpage",maxpage);
		model.addAttribute("listcount",listcount);	  
 
		// qna목록 
		int page1 =1; int limit1=6;
		if(request.getParameter("page1") != null) {
			page1=Integer.parseInt(request.getParameter("page1"));
		}		
		
		qi.setItem_no(item_no);
		int qnalistcount=this.qnaService.getQnaListCount(qi);
		qi.setStartrow1((page1-1)*6+1);//시작행번호
		qi.setEndrow1(qi.getStartrow1()+limit1-1);//끝행번호
		
		//qna 뿌려질때 정보 + 사진 이 q_no로 묶여있음
		List<QnaVO> limaqna=this.qnaService.getlimaqna(qi);
		
		int maxpage1=(int)((double)qnalistcount/limit1+0.95);
		int startpage1=(((int)((double)page1/6+0.9))-1)*6+1;
		int endpage1=maxpage1;
		if(endpage1 > startpage1+6-1) endpage1=startpage1+6-1;	
		
		System.out.println("startpage1 : " + startpage1);
		System.out.println("endpage1 : " + endpage1);
		System.out.println("maxpage1 : " + maxpage1);
		System.out.println("qnalistcount : " + qnalistcount);
		
		model.addAttribute("limaqna", limaqna);
		model.addAttribute("page1",page1);
		model.addAttribute("startpage1",startpage1);
		model.addAttribute("endpage1",endpage1);
		model.addAttribute("maxpage1",maxpage1);
		model.addAttribute("qnalistcount",qnalistcount);	  			
		
		return "sub/item_detail";
	}
	
	// 디테일 리뷰작성
	@RequestMapping("/review_write")
	public String review_write(HttpServletRequest request, Model m, HttpSession hs
			,@RequestParam("item_no")int item_no) {
		
		m.addAttribute("login_id",hs.getAttribute("id"));
		try {
			m.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("=================================");
		System.out.println(" id : " + (String)hs.getAttribute("id"));
		System.out.println("=================================");
		System.out.println("item_no : " + item_no);
		System.out.println("=================================");
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		m.addAttribute("page", page);
		m.addAttribute("mem_id", (String)hs.getAttribute("id"));
		m.addAttribute("item_no", item_no);
		return "review/review_write";
	}
	
	// 디테일 리뷰저장
	@RequestMapping("/review_write_OK")
	public String review_write_OK(MultipartHttpServletRequest multireq, HttpServletResponse response,
			ReviewVO ri) throws Exception {
		
		String mem_pw = this.memberService.rfindpw(ri);
		
		if(!mem_pw.equals(ri.getR_pwd())) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			
			return null;
		}else if(mem_pw.equals(ri.getR_pwd())) {
			reviewService.insertReview(ri,multireq);
			return "redirect:/item_detail?item_no="+ri.getItem_no();
		}
		return null;
	}
	
	// 수정폼(리뷰수정)
	@RequestMapping("/ReviewEdit")
	public String ReviewEdit(Model model, HttpServletRequest request, HttpSession hs, ReviewVO ri, @RequestParam("r_no")int r_no) {		
		model.addAttribute("login_id",hs.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//리스트출력
		ri= this.reviewService.getReviewCont(r_no);
		
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		model.addAttribute("item_no", item_no);
		model.addAttribute("mem_id", (String)hs.getAttribute("id"));
		model.addAttribute("ri",ri);
		model.addAttribute("r_no", r_no);
		model.addAttribute("page", page);
		
		return "/review/review_edit";
	}
	
	
	// 리뷰수정완료
	@RequestMapping("/review_edit_OK")
	public String review_edit_OK(ReviewVO ri, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multireq) throws Exception {
		
		String mem_pw = this.memberService.rfindpw(ri);
		
		if(!mem_pw.equals(ri.getR_pwd())) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		
			return null;
		} else if(mem_pw.equals(ri.getR_pwd())) {
			
			this.reviewService.editReview(ri,multireq);
		
		return "redirect:/item_detail?item_no="+ri.getItem_no();
		}
		return null;
	}

	// 삭제
	@RequestMapping("/ReviewDel")
	public String ReviewDel(Model model, HttpServletRequest request, HttpSession hs, ReviewVO ri)throws Exception {
		
		model.addAttribute("login_id",hs.getAttribute("id"));
		try {
			model.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		int r_no = Integer.parseInt(request.getParameter("r_no"));
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		ri=this.reviewService.getReviewCont(r_no);
		
		model.addAttribute("ri", ri);
		model.addAttribute("item_no", item_no);
		model.addAttribute("mem_id", (String)hs.getAttribute("id"));
		model.addAttribute("r_no",r_no);
		model.addAttribute("page", page);
		
		return "/review/review_del";	
	}
	
	// 삭제완료
	@RequestMapping("/review_del_OK")
	public String review_del_OK(ReviewVO ri, @RequestParam(value="r_no")int r_no, @RequestParam("item_no")int item_no,
			@RequestParam("del_pwd")String del_pwd, HttpServletResponse response) throws Exception {
		
		String mem_pw = this.memberService.rfindpw(ri);
		String mem_id = this.memberService.rfindid(ri);
		
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
			this.reviewService.delReview(r_no);
			return "redirect:/item_detail?item_no="+ri.getItem_no();
		} else if(mem_id.equals("aaaaaaa") && del_pwd.equals("aaaaaaa")) {
			this.reviewService.delReview(r_no);
			return "redirect:/item_detail?item_no="+ri.getItem_no();
		}
	return null;
	}

	////////////////////////////////////리뷰작성완료///////////////////////////////
	////////////////////////////////////QNA작성///////////////////////////////////
	
	//qna저장
	@RequestMapping("/qna_write")
	public String qna_write(HttpServletRequest request, Model m, HttpSession hs, @RequestParam("item_no")int item_no) {
		//로그인
		m.addAttribute("login_id",hs.getAttribute("id"));
		try {
			m.addAttribute("login_rank",(int) hs.getAttribute("rank"));
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		System.out.println("item_no : " + item_no);
		System.out.println("=================================");
		
		int page1 = 1;
		if(request.getParameter("page1") != null) {
		page1=Integer.parseInt(request.getParameter("page1"));
		}
		
		m.addAttribute("page1", page1);
		m.addAttribute("mem_id", (String)hs.getAttribute("id"));
		m.addAttribute("item_no", item_no);
		return "qna/qna_write";
	}

	// qna저장확인
	@RequestMapping("/qna_write_OK")
	public String qna_write_OK(MultipartHttpServletRequest multireq, HttpServletResponse response, QnaVO qi) throws Exception {
		
		String mem_pw = this.memberService.qfindpw(qi);
		
		if(!mem_pw.equals(qi.getQ_pwd())) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('비밀번호가 틀립니다.');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
		
		return null;
		
		}else if(mem_pw.equals(qi.getQ_pwd())) {
			qi.setItem_no(Integer.parseInt(multireq.getParameter("item_no")));
			qnaService.insertQna(qi,multireq);
			return "redirect:/item_detail?item_no="+qi.getItem_no();
		}
	return null;		
		
	}
		
	//qna 수정
	@RequestMapping("QnaEdit")
	public String qnaEdit(Model model, HttpServletRequest request, HttpSession hs, QnaVO qi, @RequestParam("q_no")int q_no) {
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
			
			return "/qna/qna_edit";
		}
			
		// qna수정완료
		@RequestMapping("/qna_edit_OK")
		public String qna_edit_OK(QnaVO qi, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multireq) throws Exception {
			
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
			
			return "redirect:/item_detail?item_no="+qi.getItem_no();
			}
			
			return null;
		}
	
	//qna 답변폼
	@RequestMapping("QnaReply")
	public String qnaReply(Model model,HttpServletRequest request, HttpSession hs, QnaVO qi, @RequestParam("q_no")int q_no) {
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
		
	
		return "/qna/qna_reply";
	}
	
	//답변저장+레벨증가
	@RequestMapping("qna_reply_OK")
	public String qna_reply_OK(QnaVO qi, HttpServletRequest request,HttpServletResponse response) throws Exception{
				  
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
			return "redirect:/item_detail?item_no="+qi.getItem_no();
		} else if(mem_id.equals("aaaaaaa") && mem_pw.equals("aaaaaaa")) {
			qnaService.replyQna(qi);
			return "redirect:/item_detail?item_no="+qi.getItem_no();
		}
		return null;
	}
	
	// 삭제
	@RequestMapping("/QnaDel")
	public String QnaDel(Model model, HttpServletRequest request, HttpSession hs, QnaVO qi)throws Exception {
		
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
		
		return "/qna/qna_del";	
	}
	
	// 삭제완료
	@RequestMapping("/qna_del_OK")
	public String qna_del_OK(QnaVO qi, @RequestParam(value="q_no")int q_no, @RequestParam("item_no")int item_no,
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
			return "redirect:/item_detail?item_no="+qi.getItem_no();
		} else if(mem_id.equals("aaaaaaa") && del_pwd.equals("aaaaaaa")) {
			this.qnaService.delQna(q_no);
			return "redirect:/item_detail?item_no="+qi.getItem_no();
		}
	return null;
	}
	
	
	@ResponseBody
	@RequestMapping("/wishlist_add")
	public int wish_add(WishVO wishVO)throws Exception {//찜목록 저장
		
		//중복제한
		if(wishService.wishCheck(wishVO) != 0) {
			return 2;
		}
		//찜 추가
		wishService.wishInsert(wishVO);
		
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("/wishlist_del")
	public int wish_del(WishVO wishVO)throws Exception {//찜목록 삭제
		
		//중복제한
		if(wishService.wishCheck(wishVO) == 0) {
			return 2;
		}
		//찜 목록에서 삭제
		wishService.wishDelete(wishVO);
		
		return 1;
	}
}
