package kr.co.sinsa.biz.product.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.StockVO;

@Repository
public class StockDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	public StockVO sizeInStock(String STOCK_PRDCODE) {
		return SST.selectOne("StockDAO.sizeInStock",STOCK_PRDCODE);
	}
}
