package kr.co.sinsa.biz.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	public ProductVO info(String PRD_CODE);
	
	public List<ProductVO> getList(Map<String, Object> map);
	public List<StockVO> getStock(Map<String, String> map);
	public List<ProductVO> listPageBestShoes(Map<String, Object> map);
	public int countProductList(Map<String, Object> map);
	public List<Integer> getJjimList(String user);
	
	public List<ProductVO> listPageBestSneakers(Map<String, Object> map) throws Exception;
	public List<ProductVO> listPageBestConverse(Map<String, Object> map) throws Exception;
	public List<ProductVO> listPageSlipOnForBest(Map<String, Object> map) throws Exception;
	public List<ProductVO> listPageMuleForBest(Map<String, Object> map) throws Exception;
}
