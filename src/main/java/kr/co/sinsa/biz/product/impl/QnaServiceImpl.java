package kr.co.sinsa.biz.product.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.QnaService;
import kr.co.sinsa.biz.product.QnaVO;

@Service("QnaService")
public class QnaServiceImpl implements QnaService{

	@Inject
	private QnaDAO DAO;
	
	@Override
	public List<QnaVO> qnaInfo(int qna_PRD_NUM) {
		return DAO.qnaInfo(qna_PRD_NUM);
	}
	@Override
	public List<QnaVO> insertQNA(Map<String, Object> map) {	
		return DAO.insertQNA(map);
	}
}
