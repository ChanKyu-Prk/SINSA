package kr.co.sinsa.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.StockDAO;
import kr.co.sinsa.admin.vo.StockLogVO;
import kr.co.sinsa.admin.vo.StockVO;

@Service
public class StockServiceImpl implements StockService {

	@Inject
	StockDAO dao;
	
	
	@Override
	public List<StockVO> stock_list(Map<String, Object> map) {
		return dao.stock_list(map);
	}
	
	@Override
	public int stock_list_count(Map<String, Object> map) {
		return dao.stock_list_count(map);
	}
	
	@Override
	public int stock_all_count() {
		return dao.stock_all_count();
	}

	@Override
	public List<StockVO> stock_pick_list(Map<String, Object> map){
		return dao.stock_pick_list(map);
	}
	
	@Override
	public int stock_pick_count(Map<String, Object> map) {
		return dao.stock_pick_count(map);
	}
	
	@Override
	public StockVO stock_info(String stock_prdcode) {
		return dao.stock_info(stock_prdcode);
	}

	@Override
	public void stock_insert(StockVO vo) {
		dao.stock_insert(vo);
	}

	@Override
	public void stock_update(StockVO vo) {
		dao.stock_update(vo);
	}

	@Override
	public void stock_delete(String picks) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("picks", picks);
		dao.stock_delete(map);
	}

	@Override
	public List<StockLogVO> stock_log(Map<String, Object> map) {
		return dao.stock_log(map);
	}
	
	@Override
	public int stock_log_count(Map<String, Object> map) {
		return dao.stock_log_count(map);
	}
}
