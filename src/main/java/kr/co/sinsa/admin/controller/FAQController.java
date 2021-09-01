package kr.co.sinsa.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.service.FAQService;
import kr.co.sinsa.admin.vo.FAQVO;
import kr.co.sinsa.biz.product.PageInfo;

@Controller
public class FAQController {
	
	@Inject
	FAQService faqService;
	
	@RequestMapping("/admin/faqList")
	public String getfaqList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord, FAQVO vo) {
		
		int page = 1;
		int limit = 5;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "faq_q";
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
		map.put("page", (page - 1) * 5);
		
		
		if (fieldName == "all" || fieldName.equals("all")) {
			listCount = faqService.faq_all_search_count(map);
			List<FAQVO> list =faqService.faq_all_search(map);
			model.addAttribute("faqInfo", vo);
			model.addAttribute("faqList", list);			
		} else {
			listCount = faqService.faq_list_count(map);
			List<FAQVO> list = faqService.faq_list(map);
			model.addAttribute("faqInfo", vo);
			model.addAttribute("faqList", list);
		}

		maxPage = (int) ((double) listCount / limit + 0.95);
		startPage = (((int) ((double) page / 5 + 0.8)) - 1) * 5 + 1;
		endPage = startPage + 9;
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
		return "admin/faqList";
	}
	
		
	@RequestMapping(value = "/admin/faqInputForm", method = RequestMethod.GET)
	public String faqInputForm(FAQVO vo) {
		return "admin/faqInputForm";
	}
			
	@RequestMapping(value = "/admin/faqInsert", method = RequestMethod.POST)
	public String faqInsert(FAQVO vo) {
		faqService.faq_insert(vo);
		return "redirect:/admin/faqList";
	}
			
	@RequestMapping("/admin/faqEdit")
	public String faqEdit(Model model, @RequestParam int faq_num) {
		model.addAttribute("faqInfo", faqService.faq_info(faq_num));
		return "admin/faqEdit";
	}
			
	@RequestMapping("/admin/faqUpdate")
	public String faqUpdate(Model model, FAQVO vo) {
//		model.addAttribute("faq_num", vo.getFaq_num());
		faqService.faq_update(vo);
		return "redirect:/admin/faqList";
	}
			
	@RequestMapping("/admin/faqDelete")
	public String faqDelete(@RequestParam int faq_num) {
		faqService.faq_delete(faq_num);
		return "redirect:/admin/faqList";
	}

}
