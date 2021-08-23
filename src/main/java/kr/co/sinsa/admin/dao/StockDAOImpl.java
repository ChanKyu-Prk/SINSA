package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.StockLogVO;
import kr.co.sinsa.admin.vo.StockVO;

@Repository
public class StockDAOImpl implements StockDAO {
	
	@Inject
	SqlSession sqlSession;
	
	public List<StockVO> stock_list(Map<String, Object> map) {
		return sqlSession.selectList("StockDAO.stock_list", map);
	}
	
	public int stock_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("StockDAO.stock_list_count", map);
	}
	
	public int stock_all_count() {
		return sqlSession.selectOne("StockDAO.stock_all_count");
	}
	
	public List<StockVO> stock_pick_list(Map<String, Object> map){
		return sqlSession.selectList("StockDAO.stock_pick_list", map);
	}
	public int stock_pick_count(Map<String, Object> map) {
		return sqlSession.selectOne("StockDAO.stock_pick_count", map);
	}
	
	public StockVO stock_info(String stock_prdcode) {
		return sqlSession.selectOne("StockDAO.stock_info", stock_prdcode);
	}
	
	public void stock_insert(StockVO vo) {
		sqlSession.insert("StockDAO.stock_insert", vo);
	}
	
	public void stock_update(StockVO vo) {
		sqlSession.update("StockDAO.stock_update", vo);
	}
	
	public void stock_delete(Map<String, Object> map) {
		sqlSession.delete("StockDAO.stock_delete", map);
		System.out.println(map);
	}
	public List<StockVO> stock_list() {
		return sqlSession.selectList("StockDAO.stock_list");
	}
	
	public List<StockLogVO> stock_log(Map<String, Object> map) {
		return sqlSession.selectList("StockDAO.stock_log", map);
	}
	
	public int stock_log_count(Map<String, Object> map) {
		return sqlSession.selectOne("StockDAO.stock_log_count", map);
	}
	
}
