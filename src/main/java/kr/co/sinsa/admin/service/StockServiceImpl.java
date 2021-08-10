package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.StockDAO;
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
	public void stock_delete(String stock_prdcode) {
		dao.stock_delete(stock_prdcode);
	}

}
