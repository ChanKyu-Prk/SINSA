package kr.co.sinsa.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.StockVO;

@Repository
public class StockDAOImpl implements StockDAO {
	
	@Inject
	SqlSession sqlSession;
	
	public List<StockVO> prd_list(String fieldName, String searchWord) {
		return sqlSession.selectList("StockDAO.stock_list");
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
	
	public void stock_delete(String stock_prdcode) {
		sqlSession.delete("StockDAO.stock_delete", stock_prdcode);
	}
	public List<StockVO> stock_list() {
		return sqlSession.selectList("StockDAO.stock_list");
	}
}
