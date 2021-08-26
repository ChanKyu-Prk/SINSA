package kr.co.sinsa.biz.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.ReviewService;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.ProductVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;

	@Override
	public ProductVO getProductVO(String PRD_CODE) {
		
		return dao.getProductVO(PRD_CODE);
	}
	
	@Override
	public List<ReviewVO> getReviewList(String PRD_CODE) {
		
		return dao.getReviewList(PRD_CODE);
	}
	@Override
	public float getAvgReview(String PRD_CODE) {
		return dao.getAvgReview(PRD_CODE);
	}
	
	
	
	
	
//	@Override
//	public void join(CustomerVO vo) {
//		joinDAO.join(vo);
//	}
//
//	@Override
//	public int idCheck(String CUS_ID) throws Exception {
//		return joinDAO.idCheck(CUS_ID);
//	}

}
