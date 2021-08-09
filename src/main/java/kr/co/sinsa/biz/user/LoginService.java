package kr.co.sinsa.biz.user;

public interface LoginService {
	
//	public String Login(CustomerVO customerVO);
	public CustomerVO login(CustomerVO vo);
	
	public UserVO getUser(CustomerVO vo);
}
