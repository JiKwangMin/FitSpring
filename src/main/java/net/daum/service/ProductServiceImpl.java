package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.ProductDAO;
import net.daum.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO procudtDao;

	@Override
	public void insertProduct(ProductVO p) {
		this.procudtDao.insertProduct(p);
		
	}

	@Override
	public int getTotalCount(ProductVO p) {
		return this.procudtDao.getTotalCount(p);
	}

	@Override
	public List<ProductVO> getProductList(ProductVO p) {
		return this.procudtDao.getProductList(p);
	}

	@Override
	public ProductVO getProductCont(int p_id) {
		return this.procudtDao.getProductCont(p_id);
	}

}
