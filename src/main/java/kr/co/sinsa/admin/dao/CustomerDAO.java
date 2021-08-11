package kr.co.sinsa.admin.dao;

import java.util.List;

import kr.co.sinsa.admin.vo.CustomerVO;

public interface CustomerDAO {
	public List<CustomerVO> CustomerList();
	public CustomerVO CustomerInfo(int CUS_NUM);
	public int CustomerInsert(CustomerVO vo);
	public int CustomerUpdate(CustomerVO vo);
	public int CustomerDelete(int CUS_NUM);
	

}
