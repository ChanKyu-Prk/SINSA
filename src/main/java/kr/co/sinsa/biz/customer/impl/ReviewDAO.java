package kr.co.sinsa.biz.customer.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.ProductVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	
	
	
	public ProductVO getProductVO(String PRD_CODE) {
		return SST.selectOne("ReviewService.getProductVO", PRD_CODE);
	}
	
	public List<ReviewVO> getReviewList(String PRD_CODE) {
		return SST.selectList("ReviewService.getReviewList", PRD_CODE);
	}
	
	public float getAvgReview (String PRD_CODE) {
		if(SST.selectOne("ReviewDAO.getAvgReview", PRD_CODE) != null)
			return SST.selectOne("ReviewDAO.getAvgReview", PRD_CODE);
		else return 0;
	}
	

}
