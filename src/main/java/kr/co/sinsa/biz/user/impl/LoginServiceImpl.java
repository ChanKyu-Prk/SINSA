package kr.co.sinsa.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.user.CustomerVO;
import kr.co.sinsa.biz.user.LoginService;
import kr.co.sinsa.biz.user.UserVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserDAO dao;

	@Override
	public CustomerVO login(CustomerVO vo) {
		
		return dao.login(vo);
	}

	@Override
	public UserVO getUser(CustomerVO vo) {
		
		return dao.getUser(vo);
	}
	
	@Override
	public String getCustomerID(CustomerVO customerVO) {
		
		return dao.getCustomerID(customerVO);
	}
	
	@Override
	public String getCustomerPWD(CustomerVO customerVO) {
		
		return dao.getCustomerPWD(customerVO);
	}
	
	@Override
	public List<CustomerVO> getAllCustomerList() {
		
		return dao.getAllCustomerList();
	}

}
