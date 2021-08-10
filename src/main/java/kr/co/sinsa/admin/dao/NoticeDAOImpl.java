package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	SqlSession sqlSession;
	
	public List<NoticeVO> notice_list(Map<String, Object> map) {
		return sqlSession.selectList("NoticeDAO.notice_list", map);
	}
	
	public int notice_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("NoticeDAO.notice_list_count", map);
	}
	
	public List<NoticeVO> notice_all_search(Map<String, Object> map) {
		return sqlSession.selectList("NoticeDAO.notice_all_search", map);
	}
	
	public int notice_all_search_count(Map<String, Object> map) {
		return sqlSession.selectOne("NoticeDAO.notice_all_search_count", map);
	}
	
	public NoticeVO notice_info(int notice_num) {
		return sqlSession.selectOne("NoticeDAO.notice_info", notice_num);
	}
	
	public void notice_insert(NoticeVO vo) {
		sqlSession.insert("NoticeDAO.notice_insert", vo);
	}
	
	public void notice_update(NoticeVO vo) {
		sqlSession.update("NoticeDAO.notice_update", vo);
	}
	
	public void notice_delete(int notice_num) {
		sqlSession.delete("NoticeDAO.notice_delete", notice_num);
	}
	public List<NoticeVO> notice_list() {
		return sqlSession.selectList("NoticeDAO.notice_list");
	}
	
}