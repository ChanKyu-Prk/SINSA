package kr.co.sinsa.biz.user.impl;

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

}
