package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertProduct(ProductVO p) {
		this.sqlSession.insert("pro_in",p);
		
	}

	@Override
	public int getTotalCount(ProductVO p) {
		return this.sqlSession.selectOne("pro_count", p);
	}

	@Override
	public List<ProductVO> getProductList(ProductVO p) {
		return this.sqlSession.selectList("pro_list",p);
	}

	@Override
	public ProductVO getProductCont(int p_id) {
		return this.sqlSession.selectOne("product_con",p_id);
	}
}
