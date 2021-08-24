package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.CustomerVO;
@Repository
public class CustomerDAOImpl implements CustomerDAO{
	
	@Autowired
	private SqlSessionTemplate SST;
	@Inject
	SqlSession sqlSession;
	
	public List<CustomerVO> customer_list(Map<String, Object> map) {
		return sqlSession.selectList("CustomerDAO.customer_list", map);
	}
	
	public int customer_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("CustomerDAO.customer_list_count", map);
	}
	
	public List<CustomerVO> customer_all_search(Map<String, Object> map) {
		return sqlSession.selectList("CustomerDAO.customer_all_search", map);
	}
	
	public int customer_all_search_count(Map<String, Object> map) {
		return sqlSession.selectOne("CustomerDAO.customer_all_search_count", map);
	}
	
	public CustomerVO customer_info(int CUS_NUM) {
		return sqlSession.selectOne("CustomerDAO.customer_info", CUS_NUM);
	}
	
	public void customer_insert(CustomerVO vo) {
		sqlSession.insert("CustomerDAO.customer_insert", vo);
	}
	
	public void customer_update(CustomerVO vo) {
		sqlSession.update("CustomerDAO.customer_update", vo);
	}
	
	public void customer_delete(int CUS_NUM) {
		sqlSession.delete("CustomerDAO.customer_delete", CUS_NUM);
	}
//	public List<CustomerVO> customer_list() {
//		return sqlSession.selectList("CustomerDAO.customer_list");
//	}
	public List<CustomerVO> customer_list() {
		return sqlSession.selectList("CustomerDAO.customer_list");
	}
	public int customerInsert(CustomerVO vo) {
		return SST.insert("CustomertDAO.customerInsert", vo);
	}
	public List<CustomerVO> CustomerList() {
		return sqlSession.selectList("CustomerDAO.customer_list");
	}
	public int idCheck(String CUS_ID){
		return SST.selectOne("CustomerDAO.idCheck",CUS_ID);
	}
	
	public int mailChk(String CUS_EMAIL) {
		return SST.selectOne("CustomerDAO.mailChk", CUS_EMAIL);
	}
	
	

}
