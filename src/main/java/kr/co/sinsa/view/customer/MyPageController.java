package kr.co.sinsa.view.customer;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.FileUploadService;
import kr.co.sinsa.biz.customer.MyOrderListVO;
import kr.co.sinsa.biz.customer.MyPageService;
import kr.co.sinsa.biz.customer.QnAVO;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.PageInfo;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageSerive;
	@Autowired
	private FileUploadService upload;

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, CustomerVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:login.do";
		} else {
			model.addAttribute("myInfo", myPageSerive.myInfo(user));
			return "customer/myPage";
		}
	}

	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String test() {

		return "customer/delevTest";
	}

	@RequestMapping(value = "/delev", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, String>> delevInquiry(@RequestBody Map<Object, Object> data) {
		List<Map<String, String>> progresses = (List<Map<String, String>>) data.get("progresses");
		return progresses;
	}

	@RequestMapping(value = "/myOrderList/{page}", method = RequestMethod.GET)
	public String myOrderList(Model model, @PathVariable("page") String pageR,
			@RequestParam(value = "fromDate", required = false) String date1,
			@RequestParam(value = "toDate", required = false) String date2, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = Integer.parseInt(pageR);
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "redirect:/login.do";
		}

		if (date1 == "")
			date1 = null;
		if (date2 == "")
			date2 = null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countmyOrderListDate(map);
			model.addAttribute("countState", myPageSerive.countStateDate(map));
			model.addAttribute("orderList", myPageSerive.myOrderListDate(map));
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			listCount = myPageSerive.countmyOrderList(map);
			model.addAttribute("countState", myPageSerive.countState(map));
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

	@RequestMapping(value = "/myOrderStatus/{ORDER_NUM}", method = RequestMethod.GET)
	public String myOrderStatus(Model model, @PathVariable("ORDER_NUM") String ORDER_NUM, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login.do";
		}
		model.addAttribute("orderList", myPageSerive.orderStatus(ORDER_NUM));
		return "customer/myOrderStatus";
	}

	@RequestMapping(value = "/jjimList/{page}", method = RequestMethod.GET)
	public String jjimList(Model model, @PathVariable("page") String pageR, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = Integer.parseInt(pageR);
		;
		int limit = 6;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "redirect:/login.do";
		} else {
			String userID = user.getCUS_ID();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
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

	@RequestMapping(value = "/myReviewList/{page}", method = RequestMethod.GET)
	public String myReviewList(Model model, @PathVariable("page") String pageR,
			@RequestParam(value = "fromDate", required = false) String date1,
			@RequestParam(value = "toDate", required = false) String date2, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = Integer.parseInt(pageR);
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "redirect:/login.do";
		}

		if (date1 == "")
			date1 = null;
		if (date2 == "")
			date2 = null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countmyOrderListDate(map);
			List<MyOrderListVO> orderList = myPageSerive.myOrderListDate(map);
			model.addAttribute("orderList", orderList);
			model.addAttribute("reviewCheck", myPageSerive.reviewCheck(orderList, user.getCUS_ID()));
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			listCount = myPageSerive.countmyOrderList(map);
			List<MyOrderListVO> orderList = myPageSerive.myOrderList(map);
			model.addAttribute("orderList", orderList);
			model.addAttribute("reviewCheck", myPageSerive.reviewCheck(orderList, user.getCUS_ID()));
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

	@RequestMapping(value = "/recentView/{page}", method = RequestMethod.GET)
	public String recentView(Model model, 
			@PathVariable("page") String pageR,
			HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO) session.getAttribute("user");
		Cookie[] cRecentlyVieweds = request.getCookies();
		int page = Integer.parseInt(pageR);
		int limit = 6;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
	

		if (user == null) {
			return "redirect:/login.do";
		} else {

			listCount = myPageSerive.countRecentView(cRecentlyVieweds);
			model.addAttribute("recentView", myPageSerive.recentView(cRecentlyVieweds, (page - 1) * limit, listCount));
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

	@RequestMapping(value = "/myProductQnA/{page}", method = RequestMethod.GET)
	public String myProductQnA(Model model,
			@PathVariable("page") String pageR,
			@RequestParam(value = "fromDate", required = false) String date1,
			@RequestParam(value = "toDate", required = false) String date2, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int page = Integer.parseInt(pageR);
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "redirect:/login.do";
		}

		if (date1 == "")
			date1 = null;
		if (date2 == "")
			date2 = null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countQnAListListDate(map);
			List<QnAVO> QnAList = myPageSerive.QnAListDate(map);
			List<ProductVO> productList = myPageSerive.productMatch(QnAList);
			model.addAttribute("QnAList", QnAList);
			model.addAttribute("productList", productList);
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			listCount = myPageSerive.countQnAListList(map);
			List<QnAVO> QnAList = myPageSerive.QnAList(map);
			List<ProductVO> productList = myPageSerive.productMatch(QnAList);
			model.addAttribute("QnAList", QnAList);
			model.addAttribute("productList", productList);
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

	@RequestMapping(value = "/passChange", method = RequestMethod.GET)
	public String passChangePassCheck(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login.do";
		}
		model.addAttribute("page", "비밀번호 변경");
		return "customer/passCheck";
	}

	@RequestMapping(value = "/passChange", method = RequestMethod.POST)
	public String passChangeForm(Model model, @RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "CUS_PWD", required = false) String newPassword, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login.do";
		}
		if (password != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("ID", user.getCUS_ID());
			map.put("PASSWORD", password);
			boolean passMatch = myPageSerive.passCheck(map);
			if (passMatch) {
				return "customer/passChange";
			} else {
				return "redirect:/passChange";
			}
		} else if (newPassword != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("ID", user.getCUS_ID());
			map.put("PASSWORD", newPassword);
			myPageSerive.passChange(map);
			return "redirect:/myOrderList/1";
		} else {
			return "";
		}

	}

	@RequestMapping(value = "/privateInfoChange", method = RequestMethod.GET)
	public String privateInfoChangePassCheck(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login.do";
		}
		model.addAttribute("page", "개인정보 수정");
		return "customer/passCheck";
	}

	@RequestMapping(value = "/privateInfoChange", method = RequestMethod.POST)
	public String privateInfoChangeForm(Model model,
			@RequestParam(value = "password", required = false) String password, CustomerVO vo,
			@RequestParam(value = "CUS_BIRTH_Date", required = false) String CUS_BIRTH_Date,
			@RequestParam(value = "CUS_EMAIL_1", required = false) String CUS_EMAIL_1,
			@RequestParam(value = "CUS_EMAIL_2", required = false) String CUS_EMAIL_2,
			@RequestParam(value = "CUS_ADDR_1", required = false) String CUS_ADDR_1,
			@RequestParam(value = "CUS_ADDR_2", required = false) String CUS_ADDR_2,
			@RequestParam(value = "CUS_ADDR_4", required = false) String CUS_ADDR_4,
			@RequestParam(value = "CUS_ADDR_5", required = false) String CUS_ADDR_5, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}
		if (password != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("ID", user.getCUS_ID());
			map.put("PASSWORD", password);
			boolean passMatch = myPageSerive.passCheck(map);
			if (passMatch) {
				CustomerVO myInfo = myPageSerive.myInfo(user);
				String[] email = myInfo.getCUS_EMAIL().split("@");
				String[] fullAddr = myInfo.getCUS_ADDR().split("\\|");
				model.addAttribute("email", email);
				model.addAttribute("addr", fullAddr);
				model.addAttribute("myInfo", myInfo);
				return "customer/privateInfoChange";
			} else {
				return "redirect:/privateInfoChange";
			}

		} else {
			vo.setCUS_ID(user.getCUS_ID());
			vo.setCUS_BIRTH(CUS_BIRTH_Date);
			String email = CUS_EMAIL_1 + "@" + CUS_EMAIL_2;
			vo.setCUS_EMAIL(email);
			String address = "(" + CUS_ADDR_1 + ")|" + CUS_ADDR_2 + "|" + CUS_ADDR_5 + "|" + CUS_ADDR_4;
			vo.setCUS_ADDR(address);
			myPageSerive.privateInfoChange(vo);
			return "redirect:/myOrderList/1";
		}

	}

	@RequestMapping(value = "/reviewWrite/{ORDERNUM}/{ORDERPRDSIZE}/{PRDCODE}", method = RequestMethod.GET)
	public String reviewWrite(Model model, @PathVariable("ORDERNUM") String ORDERNUM,
			@PathVariable("ORDERPRDSIZE") String ORDERPRDSIZE, @PathVariable("PRDCODE") String PRDCODE,
			HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}
		model.addAttribute("product", myPageSerive.productSerch(PRDCODE));
		model.addAttribute("ordernum", ORDERNUM);
		model.addAttribute("orderprdsize", ORDERPRDSIZE);

		return "customer/reviewWrite";
	}

	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewInsert(Model model, ReviewVO vo,
			@RequestParam(required = false) List<MultipartFile> multipartFile, String Tsize, String Tcolor,
			String Tsense, String Tdelv, HttpSession session, HttpServletRequest req) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login.do";
		}
		String title = Tsize + "/" + Tcolor + "/" + Tsense + "/" + Tdelv;
		vo.setREV_TITLE(title);
		vo.setREV_CUSID(user.getCUS_ID());
		if (multipartFile.get(0).isEmpty()) {
			myPageSerive.reviewInsert(vo);
		} else {
			String fileNames = upload.reviewImgUpload(multipartFile, req);
			vo.setREV_IMAGE(fileNames);
			myPageSerive.reviewInsert(vo);
		}
		return "redirect:/myReviewList/1";
	}

	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refund(String prdcode, String orderum, String prdsize) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("prdcode", prdcode);
		map.put("orderum", orderum);
		map.put("prdsize", prdsize);
		myPageSerive.refund(map);
		return "redirect:/myOrderList/1";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel(String prdcode, String orderum, String prdsize) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("prdcode", prdcode);
		map.put("orderum", orderum);
		map.put("prdsize", prdsize);
		myPageSerive.cancel(map);
		return "redirect:/myOrderList/1";
	}

	@RequestMapping(value = "/myReviews/{page}", method = RequestMethod.GET)
	public String myReviews(Model model, @PathVariable("page") String pageR,
			@RequestParam(value = "fromDate", required = false) String date1,
			@RequestParam(value = "toDate", required = false) String date2, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("user");
		int page = Integer.parseInt(pageR);
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (user == null) {
			return "redirect:/login.do";
		}

		if (date1 == "")
			date1 = null;
		if (date2 == "")
			date2 = null;
		String userID = user.getCUS_ID();
		if (date2 != null || date1 != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			Date date1_sqldate = Date.valueOf(date1);
			Date date2_sqldate = Date.valueOf(date2);
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			map.put("date1", date1_sqldate);
			map.put("date2", date2_sqldate);
			listCount = myPageSerive.countReviewsDate(map);
			List<ReviewVO> myReviews = myPageSerive.myReviewsDate(map);
			
			model.addAttribute("myReviews", myReviews);
			model.addAttribute("product", myPageSerive.productMatchReview(myReviews));
			List<String[]> titleList = new ArrayList<String[]>();
			List<String[]> imgList = new ArrayList<String[]>();
			for(int i = 0; i < myReviews.size() ; i++) {
				String[] title = myReviews.get(i).getREV_TITLE().split("/");
				titleList.add(title);
				String[] img = null;
				if(myReviews.get(i).getREV_IMAGE()!=null) {
				String str = myReviews.get(i).getREV_IMAGE().substring(0, myReviews.get(i).getREV_IMAGE().length()-1);
				img = str.split("/");
				}
				imgList.add(img);
			}
			model.addAttribute("titleList", titleList);
			model.addAttribute("imgList", imgList);
			
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", userID);
			map.put("page", (page - 1) * limit);
			listCount = myPageSerive.countReviews(map);
			List<ReviewVO> myReviews = myPageSerive.myReviews(map);
			model.addAttribute("myReviews", myReviews);
			model.addAttribute("product", myPageSerive.productMatchReview(myReviews));
			List<String[]> titleList = new ArrayList<String[]>();
			List<String[]> imgList = new ArrayList<String[]>();
			for(int i = 0; i < myReviews.size() ; i++) {
				String[] title = myReviews.get(i).getREV_TITLE().split("/");
				titleList.add(title);
				String[] img = null;
				if(myReviews.get(i).getREV_IMAGE()!=null) {
				String str = myReviews.get(i).getREV_IMAGE().substring(0, myReviews.get(i).getREV_IMAGE().length()-1);
				img = str.split("/");
				}
				imgList.add(img);
			}
			model.addAttribute("titleList", titleList);
			model.addAttribute("imgList", imgList);

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
		
		
		
		
		return "customer/viewMyReviews";
	}
	
	
}
