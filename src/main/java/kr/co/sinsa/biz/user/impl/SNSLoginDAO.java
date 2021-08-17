package kr.co.sinsa.biz.user.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.user.UserVO;

@Repository
public class SNSLoginDAO {
	@Autowired
	private SqlSessionTemplate SST;

	public int naverIDCheck(String naverID) {
		int result = -1;
		if(SST.selectOne("SNSLogin.naverIDCheck", naverID)!=null) {
			return SST.selectOne("SNSLogin.naverIDCheck", naverID);
		} else {
		return result;}
	}
	
	public int emailCheck(String email) {
		return SST.selectOne("SNSLogin.emailCheck",email);
	}
	
	public UserVO getUser(int cus_num) {
		return SST.selectOne("SNSLogin.getUser",cus_num);
	}
	
	
	public void snsJoin(CustomerVO vo) {
		SST.insert("SNSLogin.snsJoin",vo);
	}
	
	public int getCusNum(String ID) {
		return SST.selectOne("SNSLogin.getCusNum",ID);
	}
	public void insertSnsInfo(Map<String, Object> map) {
		SST.insert("SNSLogin.insertSnsInfo",map);
	}
}
