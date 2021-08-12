package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.QnaVO;

public interface QnaService {
	
	public List<QnaVO> qna_list(Map<String, Object> map);
	public int qna_list_count(Map<String, Object> map);
	public List<QnaVO> qna_all_search(Map<String, Object> map);
	public int qna_all_search_count(Map<String, Object> map);

}
