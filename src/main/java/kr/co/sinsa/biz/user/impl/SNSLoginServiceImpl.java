package kr.co.sinsa.biz.user.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.user.SNSLoginService;
import kr.co.sinsa.biz.user.UserVO;

@Service("sNSLoginService")
public class SNSLoginServiceImpl implements SNSLoginService{

	@Autowired
	private SNSLoginDAO dao;
	
	@Override
	public int naverIdCheck(String naverID) {
		return dao.naverIDCheck(naverID);
	}

	@Override
	public boolean emailCheck(String email) {
		boolean result = false;
		int check = dao.emailCheck(email);
		if(check == 1 ) {
			result = true;			
		}
		return result;
	}
	
	@Override
	public UserVO getUser(int cus_num) {
		return dao.getUser(cus_num);
	}

	@Override
	public UserVO snsJoin(CustomerVO vo, String naverID) {
		dao.snsJoin(vo);
		int cus_num = dao.getCusNum(vo.getCUS_ID());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUSNUM", cus_num);
		map.put("naverID", naverID);
		dao.insertSnsInfo(map);
		return dao.getUser(cus_num);
	}

	
	

	
}
