package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.FAQVO;

public interface FAQDAO {
	public List<FAQVO> faq_list(Map<String, Object> map);
	public int faq_list_count(Map<String, Object> map);
	public List<FAQVO> faq_all_search(Map<String, Object> map);
	public int faq_all_search_count(Map<String, Object> map);
	public FAQVO faq_info(int faq_num);
	public void faq_insert(FAQVO vo);
	public void faq_update(FAQVO vo);
	public void faq_delete(int faq_num);

}
