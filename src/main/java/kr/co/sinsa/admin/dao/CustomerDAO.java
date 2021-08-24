package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;


import kr.co.sinsa.admin.vo.CustomerVO;
public interface CustomerDAO {
	public List<CustomerVO> customer_list(Map<String, Object> map);
	public int customer_list_count(Map<String, Object> map);
	public List<CustomerVO> customer_all_search(Map<String, Object> map);
	public int customer_all_search_count(Map<String, Object> map);
	public CustomerVO customer_info(int CUS_NUM);
	public void customer_insert(CustomerVO vo);
	public void customer_update(CustomerVO vo);
	public void customer_delete(int CUS_NUM);
	public List<CustomerVO> CustomerList();
	
	public int idCheck(String CUS_ID);
	public int mailChk(String CUS_EMAIL);
	
	
	

}