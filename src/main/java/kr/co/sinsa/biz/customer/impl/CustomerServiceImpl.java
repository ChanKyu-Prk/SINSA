package kr.co.sinsa.biz.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CartVO;
import kr.co.sinsa.biz.customer.CustomerService;
import kr.co.sinsa.biz.customer.DeleteCartListVO;
import kr.co.sinsa.biz.customer.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO dao;

	
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



	
	
//	public List<BoardVO> getBoardList(BoardVO vo) {
//		return boardDAO.getBoardList(vo);
//	}
	
	
//
//	@Override
//	public UserVO getUser(CustomerVO vo) {
//		
//		return dao.getUser(vo);
//	}

}
