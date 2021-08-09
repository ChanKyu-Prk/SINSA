package kr.co.sinsa.admin.dao;

import java.util.List;

import kr.co.sinsa.admin.vo.StockVO;

public interface StockDAO {
	public List<StockVO> stock_list();
	public StockVO stock_info(String stock_procode);
	public void stock_insert(StockVO vo);
	public void stock_update(StockVO vo);
	public void stock_delete(String stock_procode);
	
}
