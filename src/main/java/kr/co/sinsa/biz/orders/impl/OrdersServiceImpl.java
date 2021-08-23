package kr.co.sinsa.biz.orders.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersAndProductVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;
import kr.co.sinsa.biz.orders.OrdersVO;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersSerivce{
	@Inject
	private OrdersDAO dao;

	@Override
	public CustomerVO cusInfoView(String CUS_ID) throws Exception{
		return dao.cusInfoView(CUS_ID);
	}

	@Override
	public OrdersAndProductVO selPrdByCode(String ORDER_PRDCODE) throws Exception {
		return dao.selPrdByCode(ORDER_PRDCODE);
	}

	@Override
	public int addOrders(OrdersVO ordersVO) throws Exception {
		return dao.addOrders(ordersVO);
	}

	@Override
	public int chkUsePoint(CustomerVO customerVO) throws Exception {
		return dao.chkUsePoint(customerVO);
	}

	@Override
	public List<OrdersVO> selOrdersById(OrdersVO ordersVO) throws Exception {
		return dao.selOrdersById(ordersVO);
	}
}
