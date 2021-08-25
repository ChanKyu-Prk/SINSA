package kr.co.sinsa.biz.customer;

import java.util.List;

import kr.co.sinsa.biz.product.ProductVO;


public interface IndexService {
	
	public List<ProductVO> getProductList();
	public List<ReviewVO> getReviewList();
	
	
	
}