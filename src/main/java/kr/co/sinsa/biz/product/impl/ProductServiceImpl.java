package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO DAO;
	
	@Override
	public ProductVO info(String PRD_CODE) {
		return DAO.info(PRD_CODE);
	}
	
	@Override
	public List<StockVO> getStock(Map<String, Object> map) {	
		return DAO.getStock(map);
	}
	
	@Override
	public List<ProductVO> getList(Map<String, Object> map) {	
		return DAO.getList(map);
	}
	
	@Override
	public List<CartVO> addCart(Map<String, Object> map) {	
		return DAO.addCart(map);
	}
	
	@Override
	public List<Integer> getJjimList(String user) {
		return DAO.getJjimList(user);
	}

	@Override
	public int countProductList(Map<String, Object> map) {
		return DAO.countProductList(map);
	}
	@Override
	public int countQNAList(Map<String, Object> map) {
		return DAO.countQNAList(map);
	}

	@Override
	public List<ProductVO> listPageBestShoes(Map<String, Object> map) {	
		return DAO.listPageBestShoes(map);
	}
	
	@Override
	public List<ProductVO> getRecommList(String PRD_GENDER){
		return DAO.getRecommList(PRD_GENDER);
	}
	

}
