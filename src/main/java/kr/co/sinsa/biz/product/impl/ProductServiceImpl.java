package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO DAO;
	
	@Override
	public ProductVO info(String PRD_CODE) {
		return DAO.info(PRD_CODE);
	}
	
	@Override
	public List<ProductVO> getList(Map<String, Object> map) {	
		return DAO.getList(map);
	}


	@Override
	public int countProductList(Map<String, Object> map) {
		return DAO.countProductList(map);
	}

	

}
