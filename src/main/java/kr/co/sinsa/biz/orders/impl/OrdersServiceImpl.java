package kr.co.sinsa.biz.orders.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersSerivce{
	@Inject
	private OrdersDAO dao;

	@Override
	public CustomerVO cusInfoView(String CUS_ID) throws Exception{
		return dao.cusInfoView(CUS_ID);
	}
}
