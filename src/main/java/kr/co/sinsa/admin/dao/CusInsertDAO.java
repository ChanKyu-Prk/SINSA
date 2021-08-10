package kr.co.sinsa.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.CustomerVO;

@Repository
public class CusInsertDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	public void insert(CustomerVO vo) {
		SST.insert("CusInsertDAO.insert", vo);
	}
	public int inCheck(String CUS_ID)throws Exception{
		return SST.selectOne("CusInsertDAO.idCheck", CUS_ID);
	}
//	public int customerInsert(CustomerVO vo) {
//		return SST.insert("CusInsertDAO.customerInsert", vo);
//	}

}
