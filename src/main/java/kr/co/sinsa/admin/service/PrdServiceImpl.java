package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.PrdDAO;
import kr.co.sinsa.admin.vo.PrdVO;

@Service
public class PrdServiceImpl implements PrdService {

	@Inject
	PrdDAO dao;
	
	@Override
	public List<PrdVO> prd_list(Map<String, Object> map) {
		return dao.prd_list(map);
	}
	
	@Override
	public int prd_list_count(Map<String, Object> map) {
		return dao.prd_list_count(map);
	}
	
	@Override
	public List<PrdVO> prd_all_search(Map<String, Object> map) {
		return dao.prd_all_search(map);
	}
	
	@Override
	public int prd_all_search_count(Map<String, Object> map) {
		return dao.prd_all_search_count(map);
	}
	

	@Override
	public PrdVO prd_info(int prd_num) {
		return dao.prd_info(prd_num);
	}

	@Override
	public void prd_insert(PrdVO vo) {
		dao.prd_insert(vo);
	}

	@Override
	public void prd_update(PrdVO vo) {
		dao.prd_update(vo);
	}

	@Override
	public void prd_delete(int prd_num) {
		dao.prd_delete(prd_num);
	}

}
