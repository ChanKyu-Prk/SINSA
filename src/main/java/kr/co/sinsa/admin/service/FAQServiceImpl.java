package kr.co.sinsa.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.FAQDAO;
import kr.co.sinsa.admin.vo.FAQVO;
@Service
public class FAQServiceImpl implements FAQService{
	
	@Inject
	FAQDAO dao;
	
	@Override
	public List<FAQVO> faq_list(){
		return dao.faq_list();
	}

}
