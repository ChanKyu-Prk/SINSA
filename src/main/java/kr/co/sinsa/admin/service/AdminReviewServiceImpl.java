package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.AdminReviewDAO;
import kr.co.sinsa.admin.vo.AdminReviewVO;

@Service
public class AdminReviewServiceImpl implements AdminReviewService{
	
	@Inject
	AdminReviewDAO dao;
	
	@Override
	public List<AdminReviewVO> review_list(Map<String, Object> map){
		return dao.review_list(map);
	}
	
	@Override
	public int review_list_count(Map<String, Object> map) {
		return dao.review_list_count(map);
	}
	
	@Override
	public List<AdminReviewVO> review_all_search(Map<String, Object> map) {
		return dao.review_all_search(map);
	}
	
	@Override
	public int review_all_search_count(Map<String, Object> map) {
		return dao.review_all_search_count(map);
	}
	
	@Override
	public AdminReviewVO review_info(int rev_num) {
		return dao.review_info(rev_num);
	}
	
	@Override
	public void review_update(AdminReviewVO vo) {
		dao.review_update(vo);
	}
	
	@Override
	public void review_delete(int rev_num) {
		dao.review_delete(rev_num);
	}

}
