package kr.co.sinsa.view.customer;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.MyPageService;
import kr.co.sinsa.biz.product.PageInfo;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageSerive;

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, CustomerVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			model.addAttribute("myInfo", myPageSerive.myInfo(user));
			return "customer/myPage";
		}
	}

	@RequestMapping(value = "/myOrderList.do", method = RequestMethod.GET)
	public String myOrderList(Model model, @RequestParam(value = "page", required = false) String pageR,
			@RequestParam(value = "date1", required = false) String date1,
			@RequestParam(value = "date2", required = false) String date2, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = 1;
		int limit = 20;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "login";
		}

		if (pageR != null) {
			page = Integer.parseInt(pageR);
		}
		if(date1 =="") date1=null;
		if(date2 =="") date2=null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countmyOrderListDate(map);
			model.addAttribute("orderList", myPageSerive.myOrderListDate(map));
		}  else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			listCount = myPageSerive.countmyOrderList(map);
			model.addAttribute("orderList", myPageSerive.myOrderList(map));
		}
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
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

		return "customer/myOrderList";
	}

	@RequestMapping(value = "/jjimList.do", method = RequestMethod.GET)
	public String jjimList(Model model, @RequestParam(value = "page", required = false) String pageR, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = 1;
		int limit = 20;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		if (pageR != null) {
			page = Integer.parseInt(pageR);
		}

		if (user == null) {
			return "login";
		} else {
			String userID = user.getCUS_ID();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			model.addAttribute("jjimList", myPageSerive.jjimList(map));
			listCount = myPageSerive.countJjimList(map);
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
			return "customer/jjimList";
		}
	}
	
	@RequestMapping(value = "/myReviewList.do", method = RequestMethod.GET)
	public String myReviewList(Model model, @RequestParam(value = "page", required = false) String pageR,
			@RequestParam(value = "date1", required = false) String date1,
			@RequestParam(value = "date2", required = false) String date2, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = 1;
		int limit = 20;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "login";
		}

		if (pageR != null) {
			page = Integer.parseInt(pageR);
		}
		if(date1 =="") date1=null;
		if(date2 =="") date2=null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countReviewListDate(map);
			model.addAttribute("reviewList", myPageSerive.reviewListDate(map));
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			listCount = myPageSerive.countReviewList(map);
			model.addAttribute("reviewList", myPageSerive.reviewList(map));
		}
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
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

		return "customer/myReviewList";
	}
	
	
	@RequestMapping(value = "/recentView.do", method = RequestMethod.GET)
	public String recentView(Model model, @RequestParam(value = "page", required = false) String pageR, HttpSession session,
			HttpServletRequest request) {
		UserVO user = (UserVO) session.getAttribute("user");
		Cookie[] cRecentlyVieweds= request.getCookies();
		int page = 1;
		int limit = 20;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		if (pageR != null) {
			page = Integer.parseInt(pageR);
		}

		if (user == null) {
			return "login";
		} else {
			
			listCount = myPageSerive.countRecentView(cRecentlyVieweds);
			model.addAttribute("recentView", myPageSerive.recentView(cRecentlyVieweds, (page - 1) * 20 , listCount ));
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
			return "customer/recentView";
		}
	}
	
	
	@RequestMapping(value = "/myProductQnA.do", method = RequestMethod.GET)
	public String myProductQnA(Model model, @RequestParam(value = "page", required = false) String pageR,
			@RequestParam(value = "date1", required = false) String date1,
			@RequestParam(value = "date2", required = false) String date2, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = 1;
		int limit = 20;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "login";
		}

		if (pageR != null) {
			page = Integer.parseInt(pageR);
		}
		if(date1 =="") date1=null;
		if(date2 =="") date2=null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countQnAListListDate(map);
			model.addAttribute("QnAList", myPageSerive.QnAListDate(map));
		}  else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * 20);
			listCount = myPageSerive.countQnAListList(map);
			model.addAttribute("QnAList", myPageSerive.QnAList(map));
		}
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
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

		return "customer/myProductQnA";
	}
}
