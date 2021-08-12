package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.QnaVO;
@Repository
public class QnaDAOImpl implements QnaDAO{
	
	@Inject
	SqlSession sqlSession;
	
	public List<QnaVO> qna_list(Map<String, Object> map) {
		return sqlSession.selectList("QnaDAO.qna_list", map);
	}
	
	public int qna_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("QnaDAO.qna_list_count", map);
	}
	
	public List<QnaVO> qna_all_search(Map<String, Object> map) {
		return sqlSession.selectList("QnaDAO.qna_all_search", map);
	}
	
	public int qna_all_search_count(Map<String, Object> map) {
		return sqlSession.selectOne("QnaDAO.qna_all_search_count", map);
	}

}
