package kr.co.sinsa.biz.product.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.ReviewColorSizeVO;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.UserCartProductStockVO;

@Repository
public class DetailReviewDAO {

	@Autowired
	private SqlSessionTemplate SST;

	
	public List<ReviewColorSizeVO> getDetailReviewList(String PRD_CODE) {

		ProductVO productVO = SST.selectOne("DetailReviewService.getProductVO", PRD_CODE);
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = SST.selectList("DetailReviewService.getDetailReviewList", PRD_CODE);
		
		List<ReviewColorSizeVO> reviewColorSizeList = new ArrayList<ReviewColorSizeVO>();
		
		for(int i=0; i<reviewList.size(); i++) {
			
			ReviewColorSizeVO reviewColorSizeVO = new ReviewColorSizeVO();
			reviewColorSizeVO.setORDER_PRDSIZE(reviewList.get(i).getREV_ORDERPRDSIZE());
			reviewColorSizeVO.setPRD_COLOR(productVO.getPRD_COLOR());
			reviewColorSizeVO.setPRD_NAME(productVO.getPRD_NAME());
			reviewColorSizeVO.setREV_CONTENT(reviewList.get(i).getREV_CONTENT());
			reviewColorSizeVO.setREV_CUSID(reviewList.get(i).getREV_CUSID());
			reviewColorSizeVO.setREV_IMAGE(reviewList.get(i).getREV_IMAGE());
			reviewColorSizeVO.setREV_NUM(reviewList.get(i).getREV_NUM());
			reviewColorSizeVO.setREV_ORDERNUM(reviewList.get(i).getREV_ORDERNUM());
			reviewColorSizeVO.setREV_ORDERPRDSIZE(reviewList.get(i).getREV_ORDERPRDSIZE());
			reviewColorSizeVO.setREV_PRDCODE(reviewList.get(i).getREV_PRDCODE());
			reviewColorSizeVO.setREV_REGDATE(reviewList.get(i).getREV_REGDATE());
			reviewColorSizeVO.setREV_STAR(reviewList.get(i).getREV_STAR());
			reviewColorSizeVO.setREV_TITLE(reviewList.get(i).getREV_TITLE());
			
			reviewColorSizeList.add(reviewColorSizeVO);
			
		}
		
		
		
		return reviewColorSizeList;
	}
	
//	public ProductVO getProductVO(String PRD_CODE) {
//
//		return SST.selectOne("DetailReviewService.getProductVO", PRD_CODE);
//	}
	
	
	
	
//
//
//	public List<ProductVO> getCartProductList(List<CartVO> cartList) {
//		List<ProductVO> cartProductList = new ArrayList<ProductVO>();
////		List<StockVO> cartStockList = new ArrayList<StockVO>();
////		List<UserCartProductStockVO> userCartProductStockList = new ArrayList<UserCartProductStockVO>();
//		ProductVO productVO = new ProductVO();
//
//
//		if(cartList != null) {
//			if(cartList.size() != 0) {
//				for(int i=0; i<cartList.size(); i++) {
//					productVO.setPRD_NUM(cartList.get(i).getCART_PRDNUM());
//					cartProductList.add((ProductVO) SST.selectOne("CartService.getCartProductList", productVO));
//					
////					productVO.setPRD_CODE(cartProductList.get(i).getPRD_CODE());
////					cartStockList.add((StockVO) SST.selectOne("CartService.getCartStockList", productVO));
//					
//				}
//			}
//		}
//		
//		return cartProductList;
//	}
//	
//	public List<StockVO> getCartStockList(List<ProductVO> cartProductList) {
//		List<StockVO> cartStockList = new ArrayList<StockVO>();
//		StockVO stockVO = new StockVO();
//		
//		if(cartProductList != null) {
//			if(cartProductList.size() != 0) {
//				for(int i=0; i<cartProductList.size(); i++) {
//					
//					
//					stockVO.setSTOCK_PRDCODE(cartProductList.get(i).getPRD_CODE());
//					cartStockList.add((StockVO) SST.selectOne("CartService.getCartStockList", stockVO));
//					
//				}
//			}
//		}
//		return cartStockList;
//	}
//
//	public void deleteCartList(UserCartProductStockVO userCartProductStockVO) {
//
//		SST.delete("CartService.deleteCartList", userCartProductStockVO);
//	}
//	
//	public void deleteAll(UserCartProductStockVO vo) {
//
//		SST.delete("CartService.deleteAll", vo);
//	}
//	
//	public void updateCartProductCount(UserCartProductStockVO vo) {
//
//		SST.update("CartService.updateCartProductCount", vo);
//	}
//	
//	public int updateSize(UserCartProductStockVO vo) {
//		
//		List<UserCartProductStockVO> checkSizeList = SST.selectList("CartService.getCheckSizeList", vo);
//		int checkNum = checkSizeList.size();
//		if(checkNum == 0) {
//			SST.update("CartService.updateSize", vo);
//		}
//
//		return checkNum;
//	}
}
