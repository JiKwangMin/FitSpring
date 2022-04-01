package net.daum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.daum.service.AdminService;
import net.daum.vo.ItemInfoVO;

@Controller
public class SubController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping("/Best")
	public String BestTOP() {
		return "sub/Best";
	}
	
	@RequestMapping("/item")
	public String sub_item() {
		return "sub/item";
	}
	
	@RequestMapping("/item_detail")
	public String sub_item_detail(Model model, ItemInfoVO ii,@RequestParam("item_no")int item_no)throws Exception {
		
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
		
		
		model.addAttribute("point", point);
		model.addAttribute("item_cont", item_cont);
		model.addAttribute("ii",ii);
		model.addAttribute("mainlist",mainlist);
		model.addAttribute("sublist",sublist);
		model.addAttribute("optionlist", optionlist);
		
		return "sub/item_detail";
	}
	
	
	
}
