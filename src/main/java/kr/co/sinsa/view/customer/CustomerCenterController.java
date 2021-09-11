package kr.co.sinsa.view.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.customer.CustomerCenterService;
import kr.co.sinsa.biz.product.PageInfo;

@Controller
public class CustomerCenterController {

	@Autowired
	private CustomerCenterService service;
	
	
	@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
	public String FAQ(Model model) {
		model.addAttribute("FAQ",service.faq());
		return "customer/FAQ";
	}
	
	@RequestMapping(value = "/notice/{page}", method = RequestMethod.GET)
	public String notice(Model model ,@PathVariable("page") String pageR) {
		int page = Integer.parseInt(pageR);
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;	
		listCount = service.countNotice();
		maxPage = (int) ((double) listCount / limit + 0.95);
		startPage = (((int) ((double) page / 5 + 0.8)) - 1) * 5 + 1;
		endPage = startPage + 4;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setEndPage(endPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("NoticeList",service.notice((page - 1) * limit));
		return "customer/notice";
	}
	
	@RequestMapping(value = "/noticeDetail{page}/{noticeNum}", method = RequestMethod.GET)
	public String noticeDetail(Model model, @PathVariable("page") String page,@PathVariable("noticeNum") String noticeNum) {
		model.addAttribute("noticeDetail",service.noticeDetail(noticeNum));
		model.addAttribute("page",page);
		
		return "customer/noticeDetail";
	}
}
