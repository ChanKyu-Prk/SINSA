package kr.co.sinsa.admin.service;

import java.util.List;

import kr.co.sinsa.admin.vo.StockVO;

public interface StockService {

	public List<StockVO> stock_list();
	public StockVO stock_info(String stock_prdcode);
	public void stock_insert(StockVO vo);
	public void stock_update(StockVO vo);
	public void stock_delete(String stock_prdcode);
	
}
