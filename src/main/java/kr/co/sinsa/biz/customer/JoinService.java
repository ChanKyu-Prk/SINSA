package kr.co.sinsa.biz.customer;

public interface JoinService {
	public void join(CustomerVO VO) ;
	public int idCheck(String CUS_ID) throws Exception;
}
