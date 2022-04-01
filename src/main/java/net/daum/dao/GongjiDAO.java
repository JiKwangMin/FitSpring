package net.daum.dao;

import java.util.List;

import net.daum.vo.GongjiVO;

public interface GongjiDAO {

	List<GongjiVO> getList();
	void updateHit(int gongji_no);
	GongjiVO getGCont(int gongji_no);

}
