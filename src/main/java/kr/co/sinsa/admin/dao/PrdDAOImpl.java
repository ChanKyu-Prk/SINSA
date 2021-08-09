package kr.co.sinsa.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.PrdVO;

@Repository
public class PrdDAOImpl implements PrdDAO {
	
	@Inject
	SqlSession sqlSession;
	
	
	public List<PrdVO> prd_list() {
		return sqlSession.selectList("PrdDAO.prd_list");
	}
	
	
	public PrdVO prd_info(int prd_num) {
		return sqlSession.selectOne("PrdDAO.prd_info", prd_num);
	}
	
	public void prd_insert(PrdVO vo) {
		sqlSession.insert("PrdDAO.prd_insert", vo);
	}
	
	public void prd_update(PrdVO vo) {
		sqlSession.update("PrdDAO.prd_update", vo);
	}
	
	public void prd_delete(int prd_num) {
		sqlSession.delete("PrdDAO.prd_delete", prd_num);
	}
	
}
