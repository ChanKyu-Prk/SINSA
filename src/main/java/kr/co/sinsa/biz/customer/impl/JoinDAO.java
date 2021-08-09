package kr.co.sinsa.biz.customer.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.CustomerVO;

@Repository
public class JoinDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	public void join(CustomerVO vo) {
		SST.insert("JoinDAO.join",vo);
	}

	public int idCheck(String CUS_ID) throws Exception{
		return SST.selectOne("JoinDAO.idCheck",CUS_ID);
	}

}
