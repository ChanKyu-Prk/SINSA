package kr.co.sinsa.admin.dao;

import java.util.List;

import kr.co.sinsa.admin.vo.PrdVO;

public interface PrdDAO {
	public List<PrdVO> prd_list();
	
	public PrdVO prd_info(int prd_num);
	public void prd_insert(PrdVO vo);
	public void prd_update(PrdVO vo);
	public void prd_delete(int prd_num);
	
}
