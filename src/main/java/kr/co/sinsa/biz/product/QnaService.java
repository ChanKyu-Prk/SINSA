package kr.co.sinsa.biz.product;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public List<QnaVO> qnaInfo(int qna_PRD_NUM);
	public List<QnaVO> insertQNA(Map<String, Object> map);
}
