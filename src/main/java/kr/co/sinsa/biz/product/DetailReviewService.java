package kr.co.sinsa.biz.product;

import java.util.List;

import kr.co.sinsa.biz.customer.ReviewColorSizeVO;

public interface DetailReviewService {
	
	
	public List<ReviewColorSizeVO> getDetailReviewList(String PRD_CODE);
	
//	public ProductVO getProductVO(String PRD_CODE);
	

}