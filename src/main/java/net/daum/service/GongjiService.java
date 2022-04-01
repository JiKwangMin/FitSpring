package net.daum.service;

import java.util.List;

import net.daum.vo.GongjiVO;

public interface GongjiService {

	List<GongjiVO> getList();
	GongjiVO getGCont(int gongji_no);

}
