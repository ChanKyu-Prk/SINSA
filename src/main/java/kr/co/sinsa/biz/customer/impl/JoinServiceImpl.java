package kr.co.sinsa.biz.customer.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.JoinService;

@Service("joinService")
public class JoinServiceImpl implements JoinService {

	@Autowired
	private JoinDAO joinDAO;

	@Override
	public void join(CustomerVO vo) {
		joinDAO.join(vo);
	}

	@Override
	public int idCheck(String CUS_ID) throws Exception {
		return joinDAO.idCheck(CUS_ID);
	}

}
