package kr.co.sinsa.biz.orders;

import kr.co.sinsa.biz.customer.CustomerVO;

public interface OrdersSerivce {
	public CustomerVO cusInfoView(String CUS_ID) throws Exception;
	public OrdersAndProductVO selPrdByCode(String ORDER_PRDCODE) throws Exception;
	public int addOrders(OrdersVO ordersVO) throws Exception;
	public int chkUsePoint(CustomerVO customerVO) throws Exception;
}
