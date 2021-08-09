package kr.co.sinsa.biz.customer;

import java.util.List;

import kr.co.sinsa.biz.user.UserVO;

public interface CustomerService {
	
	public List<CartVO> getCartList(UserVO user);
	
	public List<ProductVO> getCartProductList(List<CartVO> cartList);

	public void deleteCartList(DeleteCartListVO vo);
}
