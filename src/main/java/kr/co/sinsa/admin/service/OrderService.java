package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.OrderVO;

public interface OrderService {

	public List<OrderVO> order_list(Map<String, Object> map);
	public int order_list_count(Map<String, Object> map);
	public int sales(Map<String, Object> map);
	public int shippingreq();
	public int cancelreq();
	public void deliv_update(OrderVO vo);
	public void order_cancel(OrderVO vo);
	
	public List<OrderVO> order_pick_list(Map<String, Object> map);
	public int order_pick_count(Map<String, Object> map);
	public OrderVO order_info(String order_num);
	public void order_insert(OrderVO vo);
	public void order_delete(String order_num);
	
}
