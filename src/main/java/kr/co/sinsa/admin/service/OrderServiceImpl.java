package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.OrderDAO;
import kr.co.sinsa.admin.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	OrderDAO dao;
	
	
	@Override
	public List<OrderVO> order_list(Map<String, Object> map) {
		return dao.order_list(map);
	}
	
	@Override
	public int order_list_count(Map<String, Object> map) {
		return dao.order_list_count(map);
	}
	
	@Override
	public int order_cancel_count(Map<String, Object> map) {
		return dao.order_cancel_count(map);
	}
	
	@Override
	public int sales(Map<String, Object> map) {
		return dao.sales(map);
	}
	
	@Override
	public int minus(Map<String, Object> map) {
		return dao.minus(map);
	}

	@Override
	public int shippingreq() {
		return dao.shippingreq();
	}
	
	@Override
	public int cancelreq() {
		return dao.cancelreq();
	}

	@Override
	public void deliv_update(OrderVO vo) {
		dao.deliv_update(vo);
	}
	
	@Override
	public void order_cancel(OrderVO vo) {
		dao.order_cancel(vo);
	}
	
	@Override
	public OrderVO order_info(String order_num) {
		return dao.order_info(order_num);
	}

	@Override
	public void order_insert(OrderVO vo) {
		dao.order_insert(vo);
	}

	@Override
	public void order_delete(String order_num) {
		dao.order_delete(order_num);
	}

	@Override
	public void auto_complete() {
		dao.auto_complete();
	}
}
