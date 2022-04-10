package net.daum.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.daum.vo.ItemInfoVO;
import net.daum.vo.QnaVO;
import net.daum.vo.ReviewVO;

//C:
@Component("fileUtils")	
public class FileUtils {				
	private static final String filePath = "C:\\20210927\\teamspring_Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Pitspring\\resources\\upload";
	//파일 저장 위치 내꺼 기준임 - 
	//메인이미지
	public List<Map<String, Object>> parseInsertFileInfo(ItemInfoVO ii, MultipartHttpServletRequest multireq) throws Exception{
		
		Iterator<String> iterator = multireq.getFileNames();
		
		//MultipartFile multipartFile = null;
		Map<String, List<MultipartFile>> multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String imgDBname = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bno = ii.getItem_no();
		
		Calendar cal=Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date =cal.get(Calendar.DATE);
		
		String filePath1 = filePath +"/main" + "/" + year + "-" + month + "-" + date ;
		File file = new File(filePath1);
		if(file.exists() == false) {
			file.mkdirs();
		}
		multipartFile = multireq.getMultiFileMap();
		List<MultipartFile> files = multipartFile.get("mimg");
		for(MultipartFile file1 : files) {
			//System.out.println(file1.getOriginalFilename());
			
			originalFileName = file1.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;
			imgDBname = "/main" + "/"+year+"-"+month+"-"+date + "/" + storedFileName;
			file = new File(filePath1 + "/" + storedFileName);
			file1.transferTo(file);
			listMap = new HashMap<String, Object>();
			listMap.put("item_no", bno);
			listMap.put("main_item_origin_name", originalFileName);
			listMap.put("main_item_img", imgDBname);
			list.add(listMap);
		}
			
		return list;
	}
	
	//서브이미지
	public List<Map<String, Object>> parseInsertFileInfo1(ItemInfoVO ii, MultipartHttpServletRequest multireq) throws Exception{
				
		Iterator<String> iterator = multireq.getFileNames();
				
		//MultipartFile multipartFile = null;
		Map<String, List<MultipartFile>> multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String imgDBname = null;
				
		List<Map<String, Object>> list2 = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap2 = null;
				
		int bno = ii.getItem_no();
				
		Calendar cal=Calendar.getInstance();
				
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date =cal.get(Calendar.DATE);
				
		String filePath2 = filePath +"/sub" + "/" + year + "-" + month + "-" + date;
		File file = new File(filePath2);
		if(file.exists() == false) {
			file.mkdirs();
		}
		multipartFile = multireq.getMultiFileMap();
		List<MultipartFile> files = multipartFile.get("simg");
		for(MultipartFile file1 : files) {
			//System.out.println(file1.getOriginalFilename());
					
			originalFileName = file1.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;
			imgDBname = "/sub" + "/"+year+"-"+month+"-"+date + "/" + storedFileName;
			file = new File(filePath2 + "/" + storedFileName);
			file1.transferTo(file);
			listMap2 = new HashMap<String, Object>();
			listMap2.put("item_no", bno);
			listMap2.put("sub_item_origin_name", originalFileName);
			listMap2.put("sub_item_img", imgDBname);
			list2.add(listMap2);
		}
		return list2;
	}
	
	//배너 이미지
	public List<Map<String, Object>> parseInsertFileInfo2(ItemInfoVO ii, MultipartHttpServletRequest multireq) throws Exception{
		
		Iterator<String> iterator = multireq.getFileNames();
		
		//MultipartFile multipartFile = null;
		Map<String, List<MultipartFile>> multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String imgDBname = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bno = ii.getItem_no();
		
		Calendar cal=Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date =cal.get(Calendar.DATE);
		
		String filePath1 = filePath +"/banner" + "/" + year + "-" + month + "-" + date ;
		File file = new File(filePath1);
		if(file.exists() == false) {
			file.mkdirs();
		}
		multipartFile = multireq.getMultiFileMap();
		List<MultipartFile> files = multipartFile.get("bimg");
		for(MultipartFile file1 : files) {
			//System.out.println(file1.getOriginalFilename());
			
			originalFileName = file1.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;
			imgDBname = "/banner" + "/"+year+"-"+month+"-"+date + "/" + storedFileName;
			file = new File(filePath1 + "/" + storedFileName);
			file1.transferTo(file);
			listMap = new HashMap<String, Object>();
			listMap.put("item_no", bno);
			listMap.put("banner_origin_name", originalFileName);
			listMap.put("banner_item_img", imgDBname);
			list.add(listMap);
		}
			
		return list;
	}
	
	//리뷰이미지
	public List<Map<String, Object>> parseInsertFileInfo3(ReviewVO ri, MultipartHttpServletRequest multireq) throws Exception{
				
		Iterator<String> iterator = multireq.getFileNames();
				
		//MultipartFile multipartFile = null;
		Map<String, List<MultipartFile>> multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String imgDBname = null;
				
		List<Map<String, Object>> list3 = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap3 = null;
				
		int bno = ri.getItem_no();
		int r_no = ri.getR_no();
				
		Calendar cal=Calendar.getInstance();
				
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date =cal.get(Calendar.DATE);
		
		String filePath3 = filePath +"/review" + "/" + year + "-" + month + "-" + date ;
		File file = new File(filePath3);
		if(file.exists() == false) {
			file.mkdirs();
		}
		multipartFile = multireq.getMultiFileMap();
		List<MultipartFile> files = multipartFile.get("rimg");
		for(MultipartFile file1 : files) {
			//System.out.println(file1.getOriginalFilename());
			
			originalFileName = file1.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;
			imgDBname = "/review" + "/"+year+"-"+month+"-"+date + "/" + storedFileName;
			file = new File(filePath3 + "/" + storedFileName);
			file1.transferTo(file);
			listMap3 = new HashMap<String, Object>();
			listMap3.put("r_no",r_no);
			listMap3.put("item_no", bno);
			listMap3.put("review_orign_name", originalFileName);
			listMap3.put("review_img", imgDBname);
			list3.add(listMap3);
		}
					
		return list3;
	}
	
	//qna이미지
	public List<Map<String, Object>> parseInsertFileInfo5(QnaVO qi, MultipartHttpServletRequest multireq) throws Exception{
		
		Iterator<String> iterator = multireq.getFileNames();
				
		//MultipartFile multipartFile = null;
		Map<String, List<MultipartFile>> multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String imgDBname = null;
				
		List<Map<String, Object>> list5 = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap5 = null;
				
		int bno = qi.getItem_no();
		int q_no = qi.getQ_no();
				
		Calendar cal=Calendar.getInstance();
				
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date =cal.get(Calendar.DATE);
		
		String filePath5 = filePath +"/qna" + "/" + year + "-" + month + "-" + date ;
		File file = new File(filePath5);
		if(file.exists() == false) {
			file.mkdirs();
		}
		multipartFile = multireq.getMultiFileMap();
		List<MultipartFile> files = multipartFile.get("qimg");
		for(MultipartFile file1 : files) {
			//System.out.println(file1.getOriginalFilename());
			
			originalFileName = file1.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;
			imgDBname = "/qna" + "/"+year+"-"+month+"-"+date + "/" + storedFileName;
			file = new File(filePath5 + "/" + storedFileName);
			file1.transferTo(file);
			listMap5 = new HashMap<String, Object>();
			listMap5.put("q_no",q_no);
			listMap5.put("item_no", bno);
			listMap5.put("qna_origin_name", originalFileName);
			listMap5.put("qna_img", imgDBname);
			list5.add(listMap5);
		}
		return list5;
	}
		
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}