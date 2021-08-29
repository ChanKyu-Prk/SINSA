package kr.co.sinsa.biz.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.ReviewColorSizeVO;
import kr.co.sinsa.biz.product.DetailReviewService;

@Service("DetailReviewService")
public class DetailReviewServiceImpl implements DetailReviewService {

	@Autowired
	private DetailReviewDAO dao;

	
	
	@Override
	public List<ReviewColorSizeVO> getDetailReviewList(String PRD_CODE) {
		
		return dao.getDetailReviewList(PRD_CODE);
	}
	
//	@Override
//	public ProductVO getProductVO(String PRD_CODE) {
//		
//		return dao.getProductVO(PRD_CODE);
//	}
	
	
	
//
//	@Override
//	public List<ProductVO> getCartProductList(List<CartVO> cartList) {
//		
//		return dao.getCartProductList(cartList);
//	}
//	
//	@Override
//	public List<StockVO> getCartStockList(List<ProductVO> cartProductList) {
//		
//		return dao.getCartStockList(cartProductList);
//	}
//	
//	@Override
//	public void deleteCartList(UserCartProductStockVO userCartProductStockVO) {
//		
//		dao.deleteCartList(userCartProductStockVO);
//	}
//	
//	@Override
//	public void deleteAll(UserCartProductStockVO vo) {
//		
//		dao.deleteAll(vo);
//	}
//	
//	@Override
//	public void updateCartProductCount(UserCartProductStockVO vo) {
//		
//		dao.updateCartProductCount(vo);
//	}
//	
//	@Override
//	public int updateSize(UserCartProductStockVO vo) {
//		
//		int checkNum = dao.updateSize(vo);
//		return checkNum;
//	}
}
