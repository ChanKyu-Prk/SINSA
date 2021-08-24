package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.CustomerDAO;
import kr.co.sinsa.admin.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService{
	
//	@Autowired
//	private CusInsertDAO cusInsertDAO;
	@Inject
	CustomerDAO dao;
	
	@Override
	public List<CustomerVO> customer_list(Map<String, Object> map) {
		return dao.customer_list(map);
	}
	
	@Override
	public int customer_list_count(Map<String, Object> map) {
		return dao.customer_list_count(map);
	}
	
	@Override
	public List<CustomerVO> customer_all_search(Map<String, Object> map) {
		return dao.customer_all_search(map);
	}
	
	@Override
	public int customer_all_search_count(Map<String, Object> map) {
		return dao.customer_all_search_count(map);
	}
	

	@Override
	public CustomerVO customer_info(int CUD_NUM) {
		return dao.customer_info(CUD_NUM);
	}

	@Override
	public void customer_insert(CustomerVO vo) {
		dao.customer_insert(vo);

	}

	@Override
	public void customer_update(CustomerVO vo) {
		dao.customer_update(vo);

	}

	@Override
	public void customer_delete(int CUD_NUM) {
		dao.customer_delete(CUD_NUM);

	}
	
	@Override
	public int idCheck(String CUS_ID) throws Exception{
		return dao.idCheck(CUS_ID);
	}
	
	@Override
	public int mailChk(String CUS_EMAIL){
		return dao.mailChk(CUS_EMAIL);
	}
	
	
	

}
