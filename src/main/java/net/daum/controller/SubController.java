package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.daum.service.AdminService;
import net.daum.service.WishListService;
import net.daum.vo.ItemInfoVO;
import net.daum.vo.WishVO;

@Controller
public class SubController {
	
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
	public String sub_item_detail(HttpSession session,Model model, ItemInfoVO ii,@RequestParam("item_no")int item_no)throws Exception {
		
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
		model.addAttribute("option_total", option_total);
		model.addAttribute("point", point);
		model.addAttribute("item_cont", item_cont);
		model.addAttribute("ii",ii);
		model.addAttribute("mainlist",mainlist);
		model.addAttribute("sublist",sublist);
		model.addAttribute("optionlist", optionlist);
		
		return "sub/item_detail";
	}
	
	@ResponseBody
	@RequestMapping("/wishlist_add")
	public int wish_add(WishVO wishVO)throws Exception {
		
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
	public int wish_del(WishVO wishVO)throws Exception {
		
		//중복제한
		if(wishService.wishCheck(wishVO) == 0) {
			return 2;
		}
		//찜 목록에서 삭제
		wishService.wishDelete(wishVO);
		
		return 1;
	}
}
