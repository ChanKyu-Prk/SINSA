package kr.co.sinsa.biz.orders;

import kr.co.sinsa.biz.customer.CustomerVO;

public interface OrdersSerivce {
	public CustomerVO cusInfoView(String CUS_ID) throws Exception;
}
