package kr.co.sinsa.biz.product.impl;

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
	public List<ProductVO> listPageBestShoes(Map<String, Object> map){
		return SST.selectList("ProductList.listPageBestShoes",map);
	}
	public List<ProductVO> listPageBestConverse(Map<String, Object> map){
		return SST.selectList("ProductList.listPageBestConverse",map);
	}
	public List<ProductVO> listPageSlipOnForBest(Map<String, Object> map){
		return SST.selectList("ProductList.listPageSlipOnForBest",map);
	}
	public List<ProductVO> listPageBestSneakers(Map<String, Object> map){
		return SST.selectList("ProductList.listPageBestSneakers",map);
	}
	public List<ProductVO> listPageMuleForBest(Map<String, Object> map){
		return SST.selectList("ProductList.listPageMuleForBest",map);
	}
	
	public int countProductList(Map<String, Object> map){
		return SST.selectOne("ProductList.countProductList",map);
	}

}
