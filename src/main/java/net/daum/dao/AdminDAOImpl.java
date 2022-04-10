package net.daum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.ItemInfoVO;


@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//기본 정보 작성 
	@Override public void infoin(ItemInfoVO ii) { 
		sqlSession.insert("item_ii_in",ii); 
	}
	  
	//메인 이미지 넣기
	@Override public void mainimgin(Map<String, Object> map) {
		sqlSession.insert("item_ma_in", map); 
	}
	  
	//서브 이미지 넣기  
	@Override public void subimgin(Map<String, Object> map) {
		sqlSession.insert("item_su_in", map); 
	}

	//옵션 넣기
	@Override
	public void opin(Map<String, Object> map) {
		sqlSession.insert("item_op_in", map);
	}

	@Override
	public int getTotalCount(ItemInfoVO ii) {
		return sqlSession.selectOne("item_total",ii);
	}

	@Override
	public List<ItemInfoVO> getList(ItemInfoVO ii) {
		return sqlSession.selectList("item_list",ii);
	}

	@Override
	public void itemRe(ItemInfoVO ii) {
		sqlSession.update("item_re",ii);
	}

	@Override
	public void delitem(int item_no) {
		sqlSession.delete("item_del1",item_no);
		sqlSession.delete("item_del2",item_no);
		sqlSession.delete("item_del3",item_no);
		sqlSession.delete("item_del4",item_no);
	}

	@Override
	public List<ItemInfoVO> getStock(ItemInfoVO ii) {
		return sqlSession.selectList("item_stock",ii);
	}

	@Override
	public void updateStock(ItemInfoVO ii) {
		sqlSession.update("stock_update",ii);
	}

	@Override
	public void bannerimgin(Map<String, Object> map) {
		sqlSession.insert("banner_in", map);
	}
	
	//배너개수
	@Override
	public List<ItemInfoVO> gettotal(ItemInfoVO ii) {
		return sqlSession.selectList("banner_total",ii);
	}
	//배너삭제
	@Override
	public void badel(ItemInfoVO ii) {
		sqlSession.delete("badel", ii);
	}
	//메인 베스트 사진
	@Override
	public List<ItemInfoVO> bamalist(ItemInfoVO ii) {
		return sqlSession.selectList("bamalist", ii);
	}

	//메인 뉴 사진
	@Override
	public List<ItemInfoVO> newmalist(ItemInfoVO ii) {
		return sqlSession.selectList("newmalist", ii);
	}

	@Override
	public List<ItemInfoVO> mainview(ItemInfoVO ii) {
		return sqlSession.selectList("viewmain",ii);
	}

	@Override
	public List<ItemInfoVO> subview(ItemInfoVO ii) {
		return sqlSession.selectList("viewsub",ii);
	}

	@Override
	public List<ItemInfoVO> optionview(ItemInfoVO ii) {
		return sqlSession.selectList("viewoption",ii);
	}

	//상세보기 정보
	@Override
	public ItemInfoVO getinfo(ItemInfoVO ii) {
		return sqlSession.selectOne("viewinfo",ii);
	}

	@Override
	public int getOption_total(ItemInfoVO ii) {
		return sqlSession.selectOne("getOptionTotal", ii);
	}

	@Override
	public ItemInfoVO getPp(ItemInfoVO ii) {
		return sqlSession.selectOne("getPp",ii);
	}

	@Override
	public void updatePay(ItemInfoVO ii) {
		sqlSession.update("pay1",ii);
	}

	@Override
	public List<ItemInfoVO> getManList(String sortation) {
		return sqlSession.selectList("get_man",sortation);
	}

	
	 
	
	
}
