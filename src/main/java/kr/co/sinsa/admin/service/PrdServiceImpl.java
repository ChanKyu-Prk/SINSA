package kr.co.sinsa.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.PrdDAO;
import kr.co.sinsa.admin.vo.PrdVO;

@Service
public class PrdServiceImpl implements PrdService {

	@Inject
	PrdDAO dao;
	
	@Override
	public List<PrdVO> prd_list() {
		return dao.prd_list();
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
