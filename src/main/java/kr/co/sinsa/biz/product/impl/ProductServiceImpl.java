package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public List<StockVO> getStock(Map<String, String> map) {	
		return DAO.getStock(map);
	}
	
	@Override
	public List<ProductVO> getList(Map<String, Object> map) {	
		return DAO.getList(map);
	}
	


	@Override
	public int countProductList(Map<String, Object> map) {
		return DAO.countProductList(map);
	}

	@Override
	public List<ProductVO> listPageBestShoes(Map<String, Object> map) {	
		return DAO.listPageBestShoes(map);
	}
	@Override
	public List<ProductVO> listPageBestSneakers(Map<String, Object> map) throws Exception {
		return DAO.listPageBestSneakers(map);
	}
	@Override
	public List<ProductVO> listPageBestConverse(Map<String, Object> map) throws Exception {
		return DAO.listPageBestConverse(map);
	}
	@Override
	public List<ProductVO> listPageSlipOnForBest(Map<String, Object> map) throws Exception {
		return DAO.listPageSlipOnForBest(map);
	}
	@Override
	public List<ProductVO> listPageMuleForBest(Map<String, Object> map) throws Exception {
		return DAO.listPageMuleForBest(map);
	}
	

}
