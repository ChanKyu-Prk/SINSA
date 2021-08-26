package kr.co.sinsa.biz.customer;

import java.util.List;

import kr.co.sinsa.biz.product.ProductVO;

public interface ReviewService {
	
	public ProductVO getProductVO(String PRD_CODE);
	
	public List<ReviewVO> getReviewList(String PRD_CODE);
	public float getAvgReview(String PRD_CODE);
}
