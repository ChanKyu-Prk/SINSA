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

import kr.co.sinsa.admin.service.QnaService;
import kr.co.sinsa.admin.vo.QnaVO;
import kr.co.sinsa.biz.product.PageInfo;
@Controller
public class QnaController {

	@Inject
	QnaService qnaService;
	
	
	@RequestMapping("/admin/qnaUpdate")
	public String prdUpdate(HttpServletRequest request, Model model, QnaVO vo) {
		model.addAttribute("qna_num", vo.getQna_num());
		String referer = request.getParameter("referer");
		qnaService.qna_update(vo);
		return "redirect:"+referer;
	}
	
	
	@RequestMapping("/admin/qnaAnswer")
	public String qnaAnswer(Model model, @RequestParam int qna_num) {
		model.addAttribute("qnaInfo", qnaService.qna_info(qna_num));
		return "admin/qnaAnswer";
	}
	
	@RequestMapping("/admin/qnaDelete")
	public String qnaDelete(HttpServletRequest request, @RequestParam int qna_num) {
		qnaService.qna_delete(qna_num);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	

	
	
	
	
	
	@RequestMapping(value = "/admin/qnaList", method = RequestMethod.GET)
	public String getQnaList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "qna_title";
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
			listCount = qnaService.qna_all_search_count(map);
			List<QnaVO> list = qnaService.qna_all_search(map);
			model.addAttribute("qnaList", list);			
		} else {
			listCount = qnaService.qna_list_count(map);
			List<QnaVO> list = qnaService.qna_list(map);
			model.addAttribute("qnaList", list);
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

		return "admin/qnaList";		
	}
}
