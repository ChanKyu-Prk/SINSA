package kr.co.sinsa.biz.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.CartService;
import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.DeleteCartListVO;
import kr.co.sinsa.biz.product.ProductVO;
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
	public void deleteCartList(DeleteCartListVO vo) {
		
		dao.deleteCartList(vo);
	}
}