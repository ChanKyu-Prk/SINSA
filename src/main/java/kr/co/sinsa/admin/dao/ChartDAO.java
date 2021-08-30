package kr.co.sinsa.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.ProductVO;
@Repository
public class ChartDAO {


	@Autowired
	private SqlSessionTemplate SST;
	
	
	public List<ProductVO> getProductList() {
		List<ProductVO> ProductList = SST.selectList("ChartService.getProductList");
		return ProductList;
	}


	

}