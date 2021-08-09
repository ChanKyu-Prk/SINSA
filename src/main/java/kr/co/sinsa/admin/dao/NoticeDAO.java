package kr.co.sinsa.admin.dao;

import java.util.List;

import kr.co.sinsa.admin.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> notice_list();
	public NoticeVO notice_info(int notice_num);
	public void notice_insert(NoticeVO vo);
	public void notice_update(NoticeVO vo);
	public void notice_delete(int notice_num);
	
}
