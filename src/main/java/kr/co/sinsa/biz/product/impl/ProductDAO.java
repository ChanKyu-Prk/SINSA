package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	
	
	public List<StockVO> getStock(Map<String, Object> map){
		return SST.selectList("ProductList.getStock",map);
	}
	
	

	public ProductVO info(String PRD_CODE) {
		return SST.selectOne("ProductDAO.info", PRD_CODE);
	}
	
	public List<ProductVO> getList(Map<String, Object> map){
		return SST.selectList("ProductList.getList",map);
	}
	
	public List<Integer> getJjimList(String user) {
		return SST.selectList("ProductList.getJjimList",user);
	}
	
	
	public List<ProductVO> listPageBestShoes(Map<String, Object> map){
		return SST.selectList("ProductList.listPageBestShoes",map);
	}
	
	public int countProductList(Map<String, Object> map){
		return SST.selectOne("ProductList.countProductList",map);
	}
	public int countQNAList(Map<String, Object> map){
		return SST.selectOne("ProductList.countQNAList",map);
	}
	
	public List<CartVO> addCart(Map<String, Object> map){
		return SST.selectList("ProductList.addCart",map);
	}
	
	public List<ProductVO> getRecommList(String PRD_GENDER){
		return SST.selectList("ProductDAO.getRecommList", PRD_GENDER);
	}

}

//	public List<ProductVO> listPageBestConverse(Map<String, Object> map){
//		return SST.selectList("ProductList.listPageBestConverse",map);
//	}
//	public List<ProductVO> listPageSlipOnForBest(Map<String, Object> map){
//		return SST.selectList("ProductList.listPageSlipOnForBest",map);
//	}
//	public List<ProductVO> listPageBestSneakers(Map<String, Object> map){
//		return SST.selectList("ProductList.listPageBestSneakers",map);
//	}
//	public List<ProductVO> listPageMuleForBest(Map<String, Object> map){
//		return SST.selectList("ProductList.listPageMuleForBest",map);
//	}