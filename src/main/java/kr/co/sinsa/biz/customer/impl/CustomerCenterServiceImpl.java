package kr.co.sinsa.biz.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.vo.FAQVO;
import kr.co.sinsa.admin.vo.NoticeVO;
import kr.co.sinsa.biz.customer.CustomerCenterService;

@Service("customerCenterService")
public class CustomerCenterServiceImpl implements CustomerCenterService{

	@Autowired
	private CustomerCenterDAO dao;

	@Override
	public List<FAQVO> faq() {
		return dao.faq();
	}

	@Override
	public List<NoticeVO> notice(int page) {
		return dao.notice(page);
	}

	@Override
	public NoticeVO noticeDetail(String noticeNum) {
		return dao.noticeDetail(noticeNum);
	}

	@Override
	public int countNotice() {
		return dao.countNotice();
	}
	
	
	
	
}
