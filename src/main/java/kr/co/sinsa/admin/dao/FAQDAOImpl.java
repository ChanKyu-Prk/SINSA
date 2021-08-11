package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.FAQVO;

@Repository
public class FAQDAOImpl implements FAQDAO{
	
	@Inject
	SqlSession sqlSession;
	
	public List<FAQVO> faq_list(Map<String, Object> map) {
		return sqlSession.selectList("FAQDAO.faq_list", map);
	}
	
	public int faq_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("FAQDAO.faq_list_count", map);
	}
	
	public List<FAQVO> faq_all_search(Map<String, Object> map) {
		return sqlSession.selectList("FAQDAO.faq_all_search", map);
	}
	
	public int faq_all_search_count(Map<String, Object> map) {
		return sqlSession.selectOne("FAQDAO.faq_all_search_count", map);
	}
	
	public FAQVO faq_info(int faq_num) {
		return sqlSession.selectOne("FAQDAO.faq_info", faq_num);
	}
	
	public void faq_insert(FAQVO vo) {
		sqlSession.insert("FAQDAO.faq_insert", vo);
	}
	
	public void faq_update(FAQVO vo) {
		sqlSession.update("FAQDAO.faq_update", vo);
	}
	
	public void faq_delete(int faq_num) {
		sqlSession.delete("FAQDAO.faq_delete", faq_num);
	}

}
