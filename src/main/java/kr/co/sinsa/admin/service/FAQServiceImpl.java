package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.FAQDAO;
import kr.co.sinsa.admin.vo.FAQVO;
@Service
public class FAQServiceImpl implements FAQService{
	
	@Inject
	FAQDAO dao;
	
	@Override
	public List<FAQVO> faq_list(Map<String, Object> map) {
		return dao.faq_list(map);
	}
	
	@Override
	public int faq_list_count(Map<String, Object> map) {
		return dao.faq_list_count(map);
	}
	
	@Override
	public List<FAQVO> faq_all_search(Map<String, Object> map) {
		return dao.faq_all_search(map);
	}
	
	@Override
	public int faq_all_search_count(Map<String, Object> map) {
		return dao.faq_all_search_count(map);
	}
	
	
	@Override
	public FAQVO faq_info(int faq_num) {
		return dao.faq_info(faq_num);
	}

	@Override
	public void faq_insert(FAQVO vo) {
		dao.faq_insert(vo);

	}

	@Override
	public void faq_update(FAQVO vo) {
		dao.faq_update(vo);

	}

	@Override
	public void faq_delete(int faq_num) {
		dao.faq_delete(faq_num);

	}

}
