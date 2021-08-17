package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.QnaDAO;
import kr.co.sinsa.admin.vo.QnaVO;
@Service
public class QnaServiceImpl implements QnaService{
	
	@Inject
	QnaDAO dao;
	
	@Override
	public List<QnaVO> qna_list(Map<String, Object> map){
		return dao.qna_list(map);
	}
	
	@Override
	public int qna_list_count(Map<String, Object> map) {
		return dao.qna_list_count(map);
	}
	
	@Override
	public List<QnaVO> qna_all_search(Map<String, Object> map) {
		return dao.qna_all_search(map);
	}
	
	@Override
	public int qna_all_search_count(Map<String, Object> map) {
		return dao.qna_all_search_count(map);
	}
	
	@Override
	public QnaVO qna_info(int qna_num) {
		return dao.qna_info(qna_num);
	}
	
	@Override
	public void qna_update(QnaVO vo) {
		dao.qna_update(vo);
	}
	
	@Override
	public void qna_delete(int qna_num) {
		dao.qna_delete(qna_num);
	}

}
