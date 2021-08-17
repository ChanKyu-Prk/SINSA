package kr.co.sinsa.biz.user;
import kr.co.sinsa.biz.customer.CustomerVO;

public interface SNSLoginService {
	public int naverIdCheck(String naverID);
	public boolean emailCheck(String email);
	public UserVO getUser(int cus_num);
	public UserVO snsJoin(CustomerVO vo,String naverID);
}
