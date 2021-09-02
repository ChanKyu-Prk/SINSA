package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.QnaService;
import kr.co.sinsa.biz.product.QnaVO;

@Service("QnaService")
public class QnaServiceImpl implements QnaService{

	@Inject
	private QnaDAO DAO;
	
	@Override
	public List<QnaVO> qnaInfo(Map<String, Object> map) {
		return DAO.qnaInfo(map);
	}
	@Override
	public List<QnaVO> insertQNA(Map<String, Object> map) {	
		return DAO.insertQNA(map);
	}
	@Override
	public List<QnaVO> updateQNA(Map<String, Object> map) {	
		return DAO.updateQNA(map);
	}
	@Override
	public List<QnaVO> deleteQNA(Map<String, Object> map) {	
		return DAO.deleteQNA(map);
	}
	@Override
	public QnaVO selectQNA(String QNA_CUSID) {	
		return DAO.selectQNA(QNA_CUSID);
	}
}
