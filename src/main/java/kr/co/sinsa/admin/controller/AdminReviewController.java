package kr.co.sinsa.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.vo.AdminReviewVO;
import kr.co.sinsa.admin.service.AdminReviewService;
import kr.co.sinsa.biz.product.PageInfo;
@Controller
public class AdminReviewController {
	
	@Inject
	AdminReviewService reviewService;
	
	@RequestMapping(value = "/admin/reviewList", method = RequestMethod.GET)
	public String getReviewList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "rev_cusid";
		}
		if(searchWord == null || searchWord.equals("")) {
			searchWord = "";
		}
		if(pages !=null){
			page = Integer.parseInt(pages);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fieldName", fieldName);
		map.put("searchWord", searchWord);
		map.put("page", (page - 1) * 10);
		
		
		if (fieldName == "all" || fieldName.equals("all")) {
			listCount = reviewService.review_all_search_count(map);
			List<AdminReviewVO> list = reviewService.review_all_search(map);
			model.addAttribute("reviewList", list);			
		} else {
			listCount = reviewService.review_list_count(map);
			List<AdminReviewVO> list = reviewService.review_list(map);
			model.addAttribute("reviewList", list);
		}

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

		return "admin/reviewList";		
	}
	
	
	@RequestMapping("/admin/reviewDelete")
	public String reviewDelete(HttpServletRequest request, @RequestParam int rev_num) {
		reviewService.review_delete(rev_num);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("/admin/reviewUpdate")
	public String reviewUpdate(HttpServletRequest request, Model model, AdminReviewVO vo) {
		model.addAttribute("rev_num", vo.getRev_num());
		String referer = request.getParameter("referer");
		reviewService.review_update(vo);
		return "redirect:"+referer;
	}
	
	@RequestMapping("/admin/reviewDetail")
	public String reviewDetail(Model model, @RequestParam int rev_num) {
		model.addAttribute("reviewInfo", reviewService.review_info(rev_num));
		return "admin/reviewDetail";
	}

}
