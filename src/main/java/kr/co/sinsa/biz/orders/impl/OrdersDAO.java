package kr.co.sinsa.biz.orders.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAO {
	@Autowired
	private SqlSessionTemplate SST;
}
