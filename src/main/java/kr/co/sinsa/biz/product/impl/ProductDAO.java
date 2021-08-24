package kr.co.sinsa.biz.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate SST;
	

	public ProductVO info(String PRD_CODE) {
		return SST.selectOne("ProductDAO.info", PRD_CODE);
	}
	
	public List<ProductVO> getList(Map<String, Object> map){
		return SST.selectList("ProductList.getList",map);
	}
	
	public int countProductList(Map<String, Object> map){
		return SST.selectOne("ProductList.countProductList",map);
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
