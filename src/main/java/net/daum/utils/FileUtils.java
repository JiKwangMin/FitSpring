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




@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\20210927\\My Java\\ShopingMall\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Pitspring\\resources\\upload";
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
	
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	
}