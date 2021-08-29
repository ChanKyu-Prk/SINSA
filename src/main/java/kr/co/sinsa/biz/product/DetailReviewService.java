package kr.co.sinsa.biz.product;

import java.util.List;

import kr.co.sinsa.biz.customer.ReviewVO;

public interface DetailReviewService {
	
	
	public List<ReviewVO> getDetailReviewList(String PRD_CODE);
	

}