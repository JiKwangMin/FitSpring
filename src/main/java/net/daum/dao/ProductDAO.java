package net.daum.dao;

import java.util.List;

import net.daum.vo.ProductVO;

public interface ProductDAO {

	void insertProduct(ProductVO p);

	int getTotalCount(ProductVO p);

	List<ProductVO> getProductList(ProductVO p);

	ProductVO getProductCont(int p_id);

}
