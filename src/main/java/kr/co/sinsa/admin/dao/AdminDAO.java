package kr.co.sinsa.admin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.AdminVO;
import kr.co.sinsa.admin.vo.CustomerVO;
@Repository
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;
	
	public int Login(AdminVO vo) {
		
		return sqlSession.selectOne("kr.co.sinsa.admin.dao.AdminDAO.Login", vo);
	}
	
	
}
