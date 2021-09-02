package kr.co.sinsa.biz.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	public ProductVO info(String PRD_CODE);
	
	public List<ProductVO> getList(Map<String, Object> map);
	public List<StockVO> getStock(Map<String, Object> map);
	public List<CartVO> addCart(Map<String, Object> map);
	public List<ProductVO> listPageBestShoes(Map<String, Object> map);
	public int countQNAList(Map<String, Object> map);
	public int countProductList(Map<String, Object> map);
	public List<Integer> getJjimList(String user);
	public List<ProductVO> getRecommList(String PRD_GENDER);

}
