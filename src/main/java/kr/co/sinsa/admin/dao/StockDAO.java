package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.StockLogVO;
import kr.co.sinsa.admin.vo.StockVO;

public interface StockDAO {
	public List<StockVO> stock_list(Map<String, Object> map);
	public int stock_list_count(Map<String, Object> map);
	public int stock_all_count();
	public List<StockVO> stock_pick_list(Map<String, Object> map);
	public int stock_pick_count(Map<String, Object> map);
	public StockVO stock_info(String stock_procode);
	public void stock_insert(StockVO vo);
	public void stock_update(StockVO vo);
	public void stock_delete(Map<String, Object> map);
	public List<StockLogVO> stock_log(Map<String, Object> map);
	public int stock_log_count(Map<String, Object> map);
	
}
