package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.QnaVO;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate SST;
	

	public List<QnaVO> qnaInfo(int qna_PRD_NUM){
		return SST.selectList("ProductList.getInfo", qna_PRD_NUM);
	}
	
	public List<QnaVO> insertQNA(Map<String, Object> map){
		return SST.selectList("ProductList.insertQNA", map);
	}
}
