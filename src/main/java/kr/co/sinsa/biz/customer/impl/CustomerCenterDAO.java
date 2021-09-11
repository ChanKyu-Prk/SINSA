package kr.co.sinsa.biz.customer.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.FAQVO;
import kr.co.sinsa.admin.vo.NoticeVO;

@Repository
public class CustomerCenterDAO {

	
	@Autowired
	private SqlSessionTemplate SST;
	
	public List<FAQVO> faq(){
		return SST.selectList("customerCenter.faq");
		}
	
	public List<NoticeVO> notice(int page){
		return SST.selectList("customerCenter.notice",page);
	}
	
	public NoticeVO noticeDetail(String noticeNum){
		return SST.selectOne("customerCenter.noticeDetail",noticeNum);
	}
	
	public int countNotice() {
		return SST.selectOne("customerCenter.countNotice");
	}
}
