package net.daum.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import net.daum.service.ProductService;
import net.daum.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	// 상품등록 폼
	@GetMapping("/product_write")
	public String product_write(HttpServletRequest request,Model wm) {
		int page=1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		wm.addAttribute("page",page);
		return "admin/product_write";
	}
	
	// 등록확인
	@PostMapping("/product_write_ok")
	public String product_write_ok(@ModelAttribute ProductVO p, HttpServletRequest request) throws Exception {

		String saveFolder = request.getRealPath("./resources/upload");
		int fileSize = 5*1024*1024;
		MultipartRequest multi = null;

		multi = new MultipartRequest(request,saveFolder,fileSize,"utf-8");

		String p_id = multi.getParameter("p_id");
		String p_category1 = multi.getParameter("p_category1");
		String p_category2 = multi.getParameter("p_category2");
		String p_name = multi.getParameter("p_name");
		String p_size = multi.getParameter("p_size");
		String p_color = multi.getParameter("p_color");
		String p_price = multi.getParameter("p_price");
		String p_activition = multi.getParameter("p_activition");
		String p_stock = multi.getParameter("p_stock");
		String p_sell = multi.getParameter("p_sell");
		
		File UpFile = multi.getFile("p_path");
		
		if(UpFile != null) {
			String fileDBName = UpFile.getName();
			
			String homedir = saveFolder;
			File path01=new File(homedir);
			
			if(!path01.exists()) {
				path01.mkdir();
			}
			
			p.setP_path(fileDBName);
		} else {
			String fileDBName="";
			p.setP_path(fileDBName);
		} 
		
		p.setP_id(Integer.parseInt(p_id)); 
		p.setP_category1(p_category1);
		p.setP_category2(p_category2);
		p.setP_name(p_name);
		p.setP_size(p_size);
		p.setP_color(p_color);
		p.setP_price(Integer.parseInt(p_price));		
		p.setP_activition(p_activition);
		p.setP_stock(Integer.parseInt(p_stock));
		p.setP_sell(Integer.parseInt(p_sell));
		
		this.productService.insertProduct(p);
		
		return "redirect:/product_list";
	}
	
	// 상품목록
	@RequestMapping("/product_list")
	public String product_list(Model listM, HttpServletRequest request, ProductVO p) {
		int page=1;
		int limit=8;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 검색관련
		String find_name = request.getParameter("find_name"); // 검색어
		String find_field = request.getParameter("find_field"); // 검색필드
		p.setFind_name("%" + find_name + "%");
		p.setFind_field(find_field);
		
		int totalCount = this.productService.getTotalCount(p);
		
		p.setStartrow((page-1)*8+1);//시작 행 번호
		p.setEndrow(p.getStartrow()+limit-1);//끝 행 번호
		
		List<ProductVO> plist= this.productService.getProductList(p);//검색 전후 상품 목록
		
		//총페이지 수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지
		int startpage = (((int)((double)page/8+0.9))-1)*8+1;
		//마지막 페이지
		int endpage=maxpage;
		if(endpage>startpage+8-1)  endpage = startpage+8-1;
		
		listM.addAttribute("plist",plist);//plist속성 키이름에 목록을 저장
		listM.addAttribute("page",page);//쪽번호
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("listCount",totalCount);//listCount 속성 키이름에 검색 전후 레코드 개수를 저장
		listM.addAttribute("find_field",find_field);//검색 필드 
		listM.addAttribute("find_name",find_name);//검색어
	
		return "admin/product_list";
	} // product_list()
	
	//목록 상세보기 + 답변폼+수정폼+삭제폼
	@RequestMapping("/product_cont")
	public ModelAndView product_cont(int p_id, @RequestParam("state") String state, int page, ProductVO p) {
		
		if(state.equals("cont")) {
			p = this.productService.getProductCont(p_id);
		}
		
		ModelAndView cm = new ModelAndView();
		cm.addObject("p", p);
		cm.addObject("page", page);
		
		if(state.equals("cont")) { // 목록보기
			cm.setViewName("admin/product_cont");
		} else if(state.equals("edit")) { // 목록수정
			cm.setViewName("admin/product_edit");
		} else if(state.equals("del")) { // 목록삭제
			cm.setViewName("admin/product_del");
		}
		
		return cm;
	} // product_cont()
	
	// 목록 수정
	@RequestMapping("/product_edit_ok")
	public ModelAndView product_edit_ok(HttpServletRequest request, ProductVO p, HttpServletResponse response) throws Exception {	

	   
	    
		return null;
	}
}