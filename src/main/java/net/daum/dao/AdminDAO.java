package net.daum.dao;

import java.util.List;
import java.util.Map;

import net.daum.vo.ItemInfoVO;


public interface AdminDAO {

	
	void infoin(ItemInfoVO ii);//정보입력
	  
	void mainimgin(Map<String, Object> map);
	  
	void subimgin(Map<String, Object> map);

	void opin(Map<String, Object> map);

	int getTotalCount(ItemInfoVO ii);

	List<ItemInfoVO> getList(ItemInfoVO ii);

	void itemRe(ItemInfoVO ii);

	void delitem(int item_no);

	List<ItemInfoVO> getStock(ItemInfoVO ii);

	void updateStock(ItemInfoVO ii);

	void bannerimgin(Map<String, Object> map);

	List<ItemInfoVO> gettotal(ItemInfoVO ii);

	void badel(ItemInfoVO ii);

	List<ItemInfoVO> bamalist(ItemInfoVO ii);

	List<ItemInfoVO> newmalist(ItemInfoVO ii);

	List<ItemInfoVO> mainview(ItemInfoVO ii);

	List<ItemInfoVO> subview(ItemInfoVO ii);

	List<ItemInfoVO> optionview(ItemInfoVO ii);

	ItemInfoVO getinfo(ItemInfoVO ii);

	int getOption_total(ItemInfoVO ii);

	ItemInfoVO getPp(ItemInfoVO ii);

	void updatePay(ItemInfoVO ii);

	List<ItemInfoVO> getManList(String sortation);

	
	 

	
}
