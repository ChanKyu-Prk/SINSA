package kr.co.sinsa.biz.orders.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.CustomerVO;

@Repository
public class OrdersDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	public CustomerVO cusInfoView(String CUS_ID) {
		return SST.selectOne("OrdersDAO.cusInfoView", CUS_ID);
	}
}