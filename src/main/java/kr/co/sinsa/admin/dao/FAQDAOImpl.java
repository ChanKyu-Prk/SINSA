package kr.co.sinsa.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.FAQVO;

@Repository
public class FAQDAOImpl implements FAQDAO{
	
	@Inject
	SqlSession sqlSession;
	
	public List<FAQVO> faq_list(){
		System.out.println("faq넘오옴?444");
		return sqlSession.selectList("FAQDAO.faq_list");
	}

}
