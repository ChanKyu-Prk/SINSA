package kr.co.sinsa.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.user.CustomerVO;
import kr.co.sinsa.biz.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate SST;
	
	public CustomerVO login(CustomerVO vo) {
		return SST.selectOne("LoginService.login", vo);
	}
	
	public UserVO getUser(CustomerVO vo) {
		return SST.selectOne("LoginService.getUser", vo);
	}
	
	public String getCustomerID(CustomerVO customerVO) {
		return SST.selectOne("LoginService.getCustomerID", customerVO);
	}
	
	public String getCustomerPWD(CustomerVO customerVO) {
		return SST.selectOne("LoginService.getCustomerPWD", customerVO);
	}
	
	public List<CustomerVO> getAllCustomerList() {
		return SST.selectList("LoginService.getAllCustomerList");
	}
}
