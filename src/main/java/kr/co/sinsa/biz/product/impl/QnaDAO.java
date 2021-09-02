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
	

	public List<QnaVO> qnaInfo(Map<String, Object> map){
		return SST.selectList("ProductList.getInfo", map);
	}
	
	public List<QnaVO> insertQNA(Map<String, Object> map){
		return SST.selectList("ProductList.insertQNA", map);
	}
	public List<QnaVO> updateQNA(Map<String, Object> map){
		return SST.selectList("ProductList.updateQNA", map);
	}

	public List<QnaVO> deleteQNA(Map<String, Object> map){
		return SST.selectList("ProductList.deleteQNA", map);
	}
	public QnaVO selectQNA(String QNA_CUSID){
		return SST.selectOne("ProductList.selectQNA", QNA_CUSID);
	}
}
