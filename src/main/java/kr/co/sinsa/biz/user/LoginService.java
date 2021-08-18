package kr.co.sinsa.biz.user;

import java.util.List;

public interface LoginService {
	
	public CustomerVO login(CustomerVO vo);
	
	public UserVO getUser(CustomerVO vo);
	
	public String getCustomerID(CustomerVO customerVO);
	
	public String getCustomerPWD(CustomerVO customerVO);
	
	public List<CustomerVO> getAllCustomerList();
}
