package net.daum.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.vo.ItemInfoVO;

public interface AdminService {

	void write(ItemInfoVO ii, String[] io1, String[] io2, MultipartHttpServletRequest multireq);

	int getTotalCount(ItemInfoVO ii);

	List<ItemInfoVO> getList(ItemInfoVO ii);

	void itemRe(ItemInfoVO ii);

	void delitem(int item_no);

	List<ItemInfoVO> getStock(ItemInfoVO ii);

	void updateStock(ItemInfoVO ii);

	void bannerin(ItemInfoVO ii, MultipartHttpServletRequest multireq);

	List<ItemInfoVO> gettotal(ItemInfoVO ii);

	void badel(ItemInfoVO ii);

	List<ItemInfoVO> mabalist(ItemInfoVO ii);

	List<ItemInfoVO> newmalist(ItemInfoVO ii);

	List<ItemInfoVO> getmainview(ItemInfoVO ii);

	List<ItemInfoVO> getsubview(ItemInfoVO ii);

	List<ItemInfoVO> getoption(ItemInfoVO ii);

	ItemInfoVO getinfo(ItemInfoVO ii);

	int getOption_total(ItemInfoVO ii);

	ItemInfoVO getPp(ItemInfoVO ii);

	void updatePay(ItemInfoVO ii);

	List<ItemInfoVO> getManList(String sortation);

	

	

	
	
}
