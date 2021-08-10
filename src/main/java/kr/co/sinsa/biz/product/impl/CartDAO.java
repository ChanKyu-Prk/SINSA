package kr.co.sinsa.biz.product.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.DeleteCartListVO;
import kr.co.sinsa.biz.product.ProductVO;
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
		ProductVO productVO = new ProductVO();


		if(cartList != null) {
			if(cartList.size() != 0) {
				for(int i=0; i<cartList.size(); i++) {
					productVO.setPRD_NUM(cartList.get(i).getCART_PRDNUM());

					cartProductList.add((ProductVO) SST.selectOne("CartService.getCartProductList", productVO));

				}
			}
		}

		return cartProductList;

	}


	public void deleteCartList(DeleteCartListVO vo) {

		SST.delete("CartService.deleteCartList", vo);
	}

}