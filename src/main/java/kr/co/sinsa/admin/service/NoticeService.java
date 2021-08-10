package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> notice_list(Map<String, Object> map);
	public int notice_list_count(Map<String, Object> map);
	public List<NoticeVO> notice_all_search(Map<String, Object> map);
	public int notice_all_search_count(Map<String, Object> map);
	public NoticeVO notice_info(int notice_num);
	public void notice_insert(NoticeVO vo);
	public void notice_update(NoticeVO vo);
	public void notice_delete(int notice_num);
	
}
