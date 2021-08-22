package kr.co.sinsa.biz.product.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;
import kr.co.sinsa.biz.product.UserCartProductStockVO;
import kr.co.sinsa.biz.user.UserVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate SST;


	public List<CartVO> getCartList(UserVO user) {

		return SST.selectList("CartService.getCartList", user);
	}


	public List<ProductVO> getCartProductList(List<CartVO> cartList) {
		List<ProductVO> cartProductList = new ArrayList<ProductVO>();
//		List<StockVO> cartStockList = new ArrayList<StockVO>();
//		List<UserCartProductStockVO> userCartProductStockList = new ArrayList<UserCartProductStockVO>();
		ProductVO productVO = new ProductVO();


		if(cartList != null) {
			if(cartList.size() != 0) {
				for(int i=0; i<cartList.size(); i++) {
					productVO.setPRD_NUM(cartList.get(i).getCART_PRDNUM());
					cartProductList.add((ProductVO) SST.selectOne("CartService.getCartProductList", productVO));
					
//					productVO.setPRD_CODE(cartProductList.get(i).getPRD_CODE());
//					cartStockList.add((StockVO) SST.selectOne("CartService.getCartStockList", productVO));
					
				}
			}
		}
		
		return cartProductList;
	}
	
	public List<StockVO> getCartStockList(List<ProductVO> cartProductList) {
		List<StockVO> cartStockList = new ArrayList<StockVO>();
		StockVO stockVO = new StockVO();
		
		if(cartProductList != null) {
			if(cartProductList.size() != 0) {
				for(int i=0; i<cartProductList.size(); i++) {
					
					
					stockVO.setSTOCK_PRDCODE(cartProductList.get(i).getPRD_CODE());
					cartStockList.add((StockVO) SST.selectOne("CartService.getCartStockList", stockVO));
					
				}
			}
		}
		return cartStockList;
	}

	public void deleteCartList(UserCartProductStockVO userCartProductStockVO) {

		SST.delete("CartService.deleteCartList", userCartProductStockVO);
	}
	
	public void deleteAll(UserCartProductStockVO vo) {

		SST.delete("CartService.deleteAll", vo);
	}
	
	public void updateCartProductCount(UserCartProductStockVO vo) {

		SST.update("CartService.updateCartProductCount", vo);
	}
	
	public int updateSize(UserCartProductStockVO vo) {
		
		List<UserCartProductStockVO> checkSizeList = SST.selectList("CartService.getCheckSizeList", vo);
		int checkNum = checkSizeList.size();
		if(checkNum == 0) {
			SST.update("CartService.updateSize", vo);
		}

		return checkNum;
	}
}
