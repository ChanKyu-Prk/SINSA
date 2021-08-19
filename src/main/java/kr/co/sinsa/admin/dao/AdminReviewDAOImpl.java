package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.AdminReviewVO;

@Repository
public class AdminReviewDAOImpl implements AdminReviewDAO{
	
	@Inject
	SqlSession sqlSession;
	
	public List<AdminReviewVO> review_list(Map<String, Object> map) {
		return sqlSession.selectList("AdminReviewDAO.review_list", map);
	}
	
	public int review_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("AdminReviewDAO.review_list_count", map);
	}
	
	public List<AdminReviewVO> review_all_search(Map<String, Object> map) {
		return sqlSession.selectList("AdminReviewDAO.review_all_search", map);
	}
	
	public int review_all_search_count(Map<String, Object> map) {
		return sqlSession.selectOne("AdminReviewDAO.review_all_search_count", map);
	}
	
	public AdminReviewVO review_info(int rev_num) {
		return sqlSession.selectOne("AdminReviewDAO.review_info", rev_num);
	}
	
	public void review_delete(int rev_num) {
		sqlSession.delete("AdminReviewDAO.review_delete", rev_num);
	}
	
	public void review_update(AdminReviewVO vo) {
		sqlSession.update("AdminReviewDAO.review_update", vo);
	}

}
