package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	
	public List<OrderVO> order_list(Map<String, Object> map) {
		return sqlSession.selectList("OrderDAO.order_list", map);
	}
	
	public int order_list_count(Map<String, Object> map) {
		return sqlSession.selectOne("OrderDAO.order_list_count", map);
	}
	
	public int order_cancel_count(Map<String, Object> map) {
		return sqlSession.selectOne("OrderDAO.order_cancel_count", map);
	}
	
	public int sales(Map<String, Object> map) {
		return sqlSession.selectOne("OrderDAO.sales", map);
	}
	
	public int minus(Map<String, Object> map) {
		return sqlSession.selectOne("OrderDAO.minus", map);
	}
	
	public int shippingreq() {
		return sqlSession.selectOne("OrderDAO.shippingreq");
	}
	
	public int cancelreq() {
		return sqlSession.selectOne("OrderDAO.cancelreq");
	}
	
	public void deliv_update(OrderVO vo) {
		sqlSession.update("OrderDAO.deliv_update", vo);
	}
	
	public void order_cancel(OrderVO vo) {
		sqlSession.update("OrderDAO.order_cancel", vo);
	}

	public void auto_complete() {
		sqlSession.delete("OrderDAO.auto_complete");
	}
	
	
	public OrderVO order_info(String order_num) {
		return sqlSession.selectOne("OrderDAO.order_info", order_num);
	}
	
	public void order_insert(OrderVO vo) {
		sqlSession.insert("OrderDAO.order_insert", vo);
	}

	public void order_delete(String order_num) {
		sqlSession.delete("OrderDAO.order_delete", order_num);
	}

}
