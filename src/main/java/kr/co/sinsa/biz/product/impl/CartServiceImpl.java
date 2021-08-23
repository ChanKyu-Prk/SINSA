package kr.co.sinsa.biz.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.CartService;
import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;
import kr.co.sinsa.biz.product.UserCartProductStockVO;
import kr.co.sinsa.biz.user.UserVO;

@Service("CartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;

	@Override
	public List<CartVO> getCartList(UserVO user) {
		
		return dao.getCartList(user);
	}

	@Override
	public List<ProductVO> getCartProductList(List<CartVO> cartList) {
		
		return dao.getCartProductList(cartList);
	}
	
	@Override
	public List<StockVO> getCartStockList(List<ProductVO> cartProductList) {
		
		return dao.getCartStockList(cartProductList);
	}
	
	@Override
	public void deleteCartList(UserCartProductStockVO userCartProductStockVO) {
		
		dao.deleteCartList(userCartProductStockVO);
	}
	
	@Override
	public void deleteAll(UserCartProductStockVO vo) {
		
		dao.deleteAll(vo);
	}
	
	@Override
	public void updateCartProductCount(UserCartProductStockVO vo) {
		
		dao.updateCartProductCount(vo);
	}
	
	@Override
	public int updateSize(UserCartProductStockVO vo) {
		
		int checkNum = dao.updateSize(vo);
		return checkNum;
	}
}
