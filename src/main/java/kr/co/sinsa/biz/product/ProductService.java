package kr.co.sinsa.biz.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	public ProductVO info(String PRD_CODE);
	
	
	
	public List<ProductVO> getList(Map<String, Object> map);
	public int countProductList(Map<String, Object> map);
	
	
	
	
}
