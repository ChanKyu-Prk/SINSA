package kr.co.sinsa.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.CusInsertDAO;
import kr.co.sinsa.admin.vo.CustomerVO;


@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CusInsertDAO cusInsertDAO;
	
	
	@Override
	public void insert(CustomerVO vo) {
		cusInsertDAO.insert(vo);
	}
	@Override
	public int idCheck(String CUS_ID)throws Exception{
		return cusInsertDAO.inCheck(CUS_ID);
	}

}
