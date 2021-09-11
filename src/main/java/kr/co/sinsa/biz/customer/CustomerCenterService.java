package kr.co.sinsa.biz.customer;

import java.util.List;

import kr.co.sinsa.admin.vo.FAQVO;
import kr.co.sinsa.admin.vo.NoticeVO;

public interface CustomerCenterService {

	
	public List<FAQVO> faq();
	public List<NoticeVO> notice(int page);
	public NoticeVO noticeDetail(String noticeNum);
	public int countNotice();
}
