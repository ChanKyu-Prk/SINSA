package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.QnaVO;

public interface QnaDAO {
	public List<QnaVO> qna_list(Map<String, Object> map);
	public int qna_list_count(Map<String, Object> map);
	public List<QnaVO> qna_all_search(Map<String, Object> map);
	public int qna_all_search_count(Map<String, Object> map);
	public QnaVO qna_info(int qna_num);
	public void qna_update(QnaVO vo);
	public void qna_delete(int qna_num);

}
