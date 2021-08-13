package kr.co.sinsa.biz.product;

import java.util.List;

import kr.co.sinsa.biz.user.UserVO;

public interface CartService {
	
	public List<CartVO> getCartList(UserVO user);
	
	public List<ProductVO> getCartProductList(List<CartVO> cartList);
	
	public List<StockVO> getCartStockList(List<ProductVO> cartProductList);

	public void deleteCartList(DeleteCartListVO vo);
	
	public void deleteAll(UserCartProductStockVO vo);
	
	public void updateCartProductCount(UserCartProductStockVO vo);
}
