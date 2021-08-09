package kr.co.sinsa.biz.user;

import kr.co.sinsa.biz.customer.CustomerVO;

public interface LoginService {
	
//	public String Login(CustomerVO customerVO);
	public CustomerVO login(CustomerVO vo);
	
	public UserVO getUser(CustomerVO vo);
}
