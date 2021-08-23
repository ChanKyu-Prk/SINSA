package kr.co.sinsa.biz.orders;

import java.util.List;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.product.ProductVO;

public interface OrdersSerivce {
	public CustomerVO cusInfoView(String CUS_ID) throws Exception;
	public OrdersAndProductVO selPrdByCode(String ORDER_PRDCODE) throws Exception;
	public int addOrders(OrdersVO ordersVO) throws Exception;
	public int chkUsePoint(CustomerVO customerVO) throws Exception;
	public List<OrdersVO> selOrdersById(OrdersVO ordersVO) throws Exception;
}
