package kr.co.sinsa.biz.customer;

import java.util.List;

import kr.co.sinsa.biz.orders.OrdersVO;
import kr.co.sinsa.biz.product.ProductVO;


public interface IndexService {
	
	public List<ProductVO> getProductList();
	public List<ReviewVO> getReviewList();
	public List<ProductVO> getTopProductList();
	
	public List<ProductVO> getTopSneakersProductList();
	public List<ProductVO> getTopSportsProductList();
	
	
	
}