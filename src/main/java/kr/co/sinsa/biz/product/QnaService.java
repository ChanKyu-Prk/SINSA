package kr.co.sinsa.biz.product;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public List<QnaVO> qnaInfo(Map<String, Object> map);
	public List<QnaVO> insertQNA(Map<String, Object> map);
	public List<QnaVO> updateQNA(Map<String, Object> map);
	public List<QnaVO> deleteQNA(Map<String, Object> map);
	public QnaVO selectQNA(String QNA_CUSID);
}
