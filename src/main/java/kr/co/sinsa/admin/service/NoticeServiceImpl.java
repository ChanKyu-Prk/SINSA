package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.NoticeDAO;
import kr.co.sinsa.admin.vo.NoticeVO;
import kr.co.sinsa.admin.vo.PrdVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO dao;
	
	@Override
	public List<NoticeVO> notice_list(Map<String, Object> map) {
		return dao.notice_list(map);
	}
	
	@Override
	public int notice_list_count(Map<String, Object> map) {
		return dao.notice_list_count(map);
	}
	
	@Override
	public List<NoticeVO> notice_all_search(Map<String, Object> map) {
		return dao.notice_all_search(map);
	}
	
	@Override
	public int notice_all_search_count(Map<String, Object> map) {
		return dao.notice_all_search_count(map);
	}
	

	@Override
	public NoticeVO notice_info(int notice_num) {
		return dao.notice_info(notice_num);
	}

	@Override
	public void notice_insert(NoticeVO vo) {
		dao.notice_insert(vo);

	}

	@Override
	public void notice_update(NoticeVO vo) {
		dao.notice_update(vo);

	}

	@Override
	public void notice_delete(int notice_num) {
		dao.notice_delete(notice_num);

	}

}
