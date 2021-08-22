package kr.co.sinsa.biz.product;

import java.util.List;

import kr.co.sinsa.biz.user.UserVO;

public interface CartService {
	
	public List<CartVO> getCartList(UserVO user);
	
	public List<ProductVO> getCartProductList(List<CartVO> cartList);
	
	public List<StockVO> getCartStockList(List<ProductVO> cartProductList);

	public void deleteCartList(UserCartProductStockVO userCartProductStockVO);
	
	public void deleteAll(UserCartProductStockVO vo);
	
	public void updateCartProductCount(UserCartProductStockVO vo);

	public int updateSize(UserCartProductStockVO vo);

//	public void getCheckSizeList(UserCartProductStockVO vo);
}