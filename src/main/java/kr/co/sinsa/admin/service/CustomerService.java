package kr.co.sinsa.admin.service;

import kr.co.sinsa.admin.vo.CustomerVO;

public interface CustomerService {
	public void insert(CustomerVO vo);
	public int idCheck(String CUS_ID) throws Exception;

}
