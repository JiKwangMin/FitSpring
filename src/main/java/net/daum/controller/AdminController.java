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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.AdminService;
import net.daum.vo.ItemInfoVO;





@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	
	//어드민 메인
	@RequestMapping("/ad_index")
	public ModelAndView ad_index(HttpSession hs) throws Exception{
		ModelAndView list = new ModelAndView();
		hs.getAttribute("id");
		hs.getAttribute("rank");
		
		list.addObject("login_id",(String) hs.getAttribute("id"));
		list.addObject("rank",(int) hs.getAttribute("rank"));
		list.setViewName("/adform/AdminIndex");
		return list;
	}
	
	//어드민 제품등록
	@RequestMapping("/ItemCreate")
	public ModelAndView ItemCreate(HttpSession hs) throws Exception{
		ModelAndView list = new ModelAndView();
		hs.getAttribute("id");
		hs.getAttribute("rank");
		
		list.addObject("login_id",(String) hs.getAttribute("id"));
		list.addObject("rank",(int) hs.getAttribute("rank"));
		list.setViewName("/adform/ItemCreate");
		return list;
	}
	
	//어드민 제품등록 DB저장
	@RequestMapping("/ItemCreate_OK")
	public String ItemDB(MultipartHttpServletRequest multireq, HttpServletRequest request,
			ItemInfoVO ii,@RequestParam("option_val1") String[] io1, @RequestParam("option_val2") String[] io2) throws Exception{
		
		
		
		adminService.write(ii,io1,io2,multireq);
		return "redirect:/ItemList";
	}
	
	//어드민 제품목록
	@RequestMapping("ItemList")
	public String ItemList(@ModelAttribute ItemInfoVO ii, Model model, HttpServletRequest request) throws Exception{
		
		int page=1;
		int limit=4;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		//토탈카운트 가져오기
		int totalCount = this.adminService.getTotalCount(ii);
		
		ii.setStartrow((page-1)*4+1);//시작행
		ii.setEndrow(ii.getStartrow()+limit-1);//끝행
		
		//목록가져오기 (메인이미지1개,카테고리1,2, 상품이름,등록일,상품가격)
		List<ItemInfoVO> iilist = this.adminService.getList(ii);
		
		
		int maxpage = (int)((double)totalCount/limit+0.95); //총 페이지 
		int startpage = (((int)((double)page/4+0.9))-1)*4+1;
		int endpage = maxpage;
		if(endpage > startpage+4-1) endpage = startpage+4-1;
		
		model.addAttribute("iilist", iilist);
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("totalCount", totalCount);
		
		
		return "/adform/ItemList";
	}
	
	//수정폼(상품이름,가격)
	@RequestMapping("/ItemEdit")
	public String ItemEdit(Model model,HttpServletRequest request) throws Exception{
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		model.addAttribute("item_no",item_no);
		return "/adform/ItemEdit";
	}
	
	//수정완료
	@RequestMapping("/ItemEdit_OK")
	public String ItemEditOK(ItemInfoVO ii, HttpServletRequest request, HttpServletResponse response)throws Exception{
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		String item_name = request.getParameter("item_name");
		
		ii.setItem_no(item_no); ii.setItem_price(item_price); ii.setItem_name(item_name);
		
		this.adminService.itemRe(ii);
		
		
		return "redirect:/ItemList";
	}
	
	//삭제
	@RequestMapping("ItemDel_OK")
	public String ItemDelOK(@RequestParam("item_no")int item_no)throws Exception{
		
		this.adminService.delitem(item_no);
		
		return "redirect:/ItemList";
	}
	
	//재고파악 폼
	@RequestMapping("/ItemStock")
	public String ItemStock(Model model,HttpServletRequest request,ItemInfoVO ii) throws Exception{
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		ii.setItem_no(item_no);
		
		//입력한 총재고값,판매량 가져오기.
		List<ItemInfoVO> ilist = this.adminService.getStock(ii);
		
		String item_name = ilist.get(0).getItem_name();
		
		model.addAttribute("item_no",item_no);
		model.addAttribute("ilist",ilist);
		model.addAttribute("item_name", item_name);
		return "/adform/ItemStock";
	}
	
	//재고변경하기
	@RequestMapping("/ItemStock_OK")
	public String ItemStockOK(HttpServletRequest request, HttpServletResponse response, ItemInfoVO ii)throws Exception{
		
		int pluse_stock = Integer.parseInt(request.getParameter("pluse_stock"));
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		String option_val1 = request.getParameter("option_val1");
		int stock = Integer.parseInt(request.getParameter("stock"));
		
		int option_val2 = stock + pluse_stock;
		
		ii.setItem_no(item_no); ii.setOption_val1(option_val1); ii.setOption_val2(option_val2);
		
		this.adminService.updateStock(ii);
		
		
		
		return "redirect:/ItemList";
	}
	
	//배너 등록 폼
	@RequestMapping("/ItemBanner")
	public String ItemBanner(@RequestParam("item_no")int item_no, Model model)throws Exception {
		
		model.addAttribute("item_no",item_no);
		return "/adform/ItemBanner";
	}
	
	//배너 등록 완료
	@RequestMapping("/ItemBanner_OK")
	public String ItemBannerOK(@RequestParam("item_no")int item_no, MultipartHttpServletRequest multireq,
			HttpServletResponse response, ItemInfoVO ii)throws Exception{
		ii.setItem_no(item_no);
		//배너 파일 개수 확인용. 3개면 하나 지우고 넣는거 실행.
		try {
			List<ItemInfoVO> balist = this.adminService.gettotal(ii);
			
			if(balist.size() >= 3) {
				this.adminService.badel(ii);
			}
			
			this.adminService.bannerin(ii,multireq);
		}catch(Exception e) {
			//개수가 없으면 그냥 넣기 ->
			this.adminService.bannerin(ii,multireq);
		}
		return "redirect:/ItemList";
	}
}










