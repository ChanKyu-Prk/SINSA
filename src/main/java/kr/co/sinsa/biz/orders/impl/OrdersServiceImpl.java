package kr.co.sinsa.biz.orders.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersSerivce{
	@Autowired
	private OrdersDAO dao;

	@Override
	public CustomerVO cusInfoView(String CUS_ID) {
		return dao.cusInfoView(CUS_ID);
	}
}
