package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.PrdVO;

public interface PrdService {

	public List<PrdVO> prd_list(Map<String, Object> map);
	public int prd_list_count(Map<String, Object> map);
	public List<PrdVO> prd_all_search(Map<String, Object> map);
	public int prd_all_search_count(Map<String, Object> map);
	public PrdVO prd_info(String prd_code);
	public void prd_insert(PrdVO vo);
	public void prd_update(PrdVO vo);
	public void prd_delete(String prd_code);
	public String prd_delete_stock(String prd_code);
	
	
}
