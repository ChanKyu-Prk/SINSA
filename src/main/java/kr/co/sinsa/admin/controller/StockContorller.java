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

import kr.co.sinsa.admin.service.StockService;
import kr.co.sinsa.admin.vo.PrdVO;
import kr.co.sinsa.admin.vo.StockVO;
import kr.co.sinsa.biz.product.PageInfo;

@Controller
public class StockContorller {
	
	@Inject
	StockService stockService;

	@RequestMapping("/admin/stockList")
	public String getStockList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		

		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "stock_prdcode";
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
		

		listCount = stockService.stock_list_count(map);
		List<StockVO> list = stockService.stock_list(map);
		model.addAttribute("stockList", list);


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

		return "admin/stockList";		
	}
	
	@RequestMapping("/admin/stockInfo")
	public String getStock(Model model, @RequestParam String stock_prdcode) {
		model.addAttribute("stockInfo", stockService.stock_info(stock_prdcode));
		return "admin/stockInfo";
	}
			
	@RequestMapping(value = "/admin/stockAdd", method = RequestMethod.GET)
	public String stockInputForm(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord, StockVO vo) {
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "stock_prdcode";
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
		

		listCount = stockService.stock_list_count(map);
		List<StockVO> list = stockService.stock_list(map);
		model.addAttribute("stockList", list);

		model.addAttribute("stockInfo", vo);

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
		
		return "admin/stockAddForm";
	}
			
	@RequestMapping(value = "/admin/stockInsert", method = RequestMethod.POST)
	public String stockInsert(StockVO vo) {
		stockService.stock_insert(vo);
		return "redirect:/admin/stockList";
	}
			
	@RequestMapping("/admin/stockEdit")
	public String stockEdit(Model model, @RequestParam String stock_prdcode) {
		model.addAttribute("stockInfo", stockService.stock_info(stock_prdcode));
		return "admin/stockEdit";
	}
			
	@RequestMapping("/admin/stockUpdate")
	public String stockUpdate(Model model, StockVO vo) {
		//model.addAttribute("stock_prdcode", vo.getStock_prdcode());
		stockService.stock_update(vo);
		return "redirect:/admin/stockAdd";
	}
			
	@RequestMapping("/admin/stockDelete")
	public String stockDelete(@RequestParam String stock_prdcode) {
		stockService.stock_delete(stock_prdcode);
		return "redirect:/admin/stockList";
	}
	
}
