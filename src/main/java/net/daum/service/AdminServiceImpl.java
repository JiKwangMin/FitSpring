package net.daum.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.dao.AdminDAO;
import net.daum.utils.FileUtils;
import net.daum.vo.ItemInfoVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private AdminDAO adminDao;
	//등록
	@Override
	public void write(ItemInfoVO ii, String[] io1, String[] io2, MultipartHttpServletRequest multireq) {
		//기본정보 1개만 들어있는거 넣을꺼임 
				this.adminDao.infoin(ii);
						
				//메인이미지 넣기 
				List<Map<String, Object>> mainlist; 
				try { 
					mainlist = fileUtils.parseInsertFileInfo(ii, multireq); 
					for(int i=0; i<mainlist.size(); i++){ 
							this.adminDao.mainimgin(mainlist.get(i));
						}
					}catch (Exception e) {
						e.printStackTrace(); }
						
				//서브이미지 넣기 
				List<Map<String, Object>> sublist; 
				try { 
					sublist = fileUtils.parseInsertFileInfo1(ii, multireq); 
					for(int i=0; i<sublist.size(); i++){ 
						this.adminDao.subimgin(sublist.get(i)); 
					} 
				} catch (Exception e) {
					e.printStackTrace();
				}
						
				//옵션정보넣기
				List<Map<String, Object>> io = new ArrayList();
				
				//받은 배열 전부 어레이로 만들기
				ArrayList<String> io11 = new ArrayList<>();
				for(int i=0; i<io1.length; i++) {
					io11.add(io1[i]);
				}
				ArrayList<String> io22 = new ArrayList<>();
				for(int i=0; i<io2.length; i++) {
					io22.add(io2[i]);
				}
				
				Map<String, Object> iolistMap = null;
				//VO에 배열로 넣기
				for(int i=0; i<io11.size(); i++) {
					iolistMap = new HashMap<String, Object>();
					iolistMap.put("item_no",ii.getItem_no());
					iolistMap.put("option_val1",io11.get(i));
					iolistMap.put("option_val2",Integer.parseInt(io22.get(i)));
					io.add(iolistMap);
				}
				
				for(int i=0; i<io.size(); i++) {
					this.adminDao.opin(io.get(i));
				}
		
	}
	//총 게시글 수 
	@Override
	public int getTotalCount(ItemInfoVO ii) {
		return this.adminDao.getTotalCount(ii);
	}
	//목록
	@Override
	public List<ItemInfoVO> getList(ItemInfoVO ii) {
		return this.adminDao.getList(ii);
	}
	
	//수정
	@Override
	public void itemRe(ItemInfoVO ii) {
		this.adminDao.itemRe(ii);
	}
	
	//삭제
	@Override
	public void delitem(int item_no) {
		this.adminDao.delitem(item_no);
	}
	
	//재고 얻기
	@Override
	public List<ItemInfoVO> getStock(ItemInfoVO ii) {
		return this.adminDao.getStock(ii);
	}
	
	//수량변경
	@Override
	public void updateStock(ItemInfoVO ii) {
		adminDao.updateStock(ii);
	}
	//배너등록
	@Override
	public void bannerin(ItemInfoVO ii, MultipartHttpServletRequest multireq) {
		List<Map<String, Object>> bannerlist;
		try {
			bannerlist = fileUtils.parseInsertFileInfo2(ii, multireq);
			for(int i=0; i<bannerlist.size(); i++){ 
				this.adminDao.bannerimgin(bannerlist.get(i)); 
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//배너개수
	@Override
	public List<ItemInfoVO> gettotal(ItemInfoVO ii) {
		return this.adminDao.gettotal(ii);
	}
	
	//배너삭제
	@Override
	public void badel(ItemInfoVO ii) {
		this.adminDao.badel(ii);
	}
	
	//메인 베스트
	@Override
	public List<ItemInfoVO> mabalist(ItemInfoVO ii) {
		
		
		return this.adminDao.bamalist(ii);
	}
	
	//메인 최신글
	@Override
	public List<ItemInfoVO> newmalist(ItemInfoVO ii) {
		
		
		return this.adminDao.newmalist(ii);
	}
	
	//상세 보기 메인사진
	@Override
	public List<ItemInfoVO> getmainview(ItemInfoVO ii) {
		return this.adminDao.mainview(ii);
	}
	
	//상세 보기 서브사진
	@Override
	public List<ItemInfoVO> getsubview(ItemInfoVO ii) {
		return this.adminDao.subview(ii);
	}
	
	//상세 보기 옵션리스트
	@Override
	public List<ItemInfoVO> getoption(ItemInfoVO ii) {
		return this.adminDao.optionview(ii);
	}
	
	//상세보기 정보
	@Override
	public ItemInfoVO getinfo(ItemInfoVO ii) {
		return this.adminDao.getinfo(ii);
	}
	
	
	

	
}
