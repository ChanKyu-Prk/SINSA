package kr.co.sinsa.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import kr.co.sinsa.admin.service.StockService;
import kr.co.sinsa.admin.vo.StockLogVO;
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
		
		int allcount = stockService.stock_all_count();
		model.addAttribute("allcount", allcount);


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
			@RequestParam(value = "searchWord", required = false) String searchWord, StockVO vo, String pick) {
		
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
	
	@RequestMapping(value = "/admin/stockAdd", method = RequestMethod.POST)
	public String stockInputForm(HttpServletRequest request, Model model, StockVO vo) {
		
		String pick = request.getParameter("picks");
		System.out.println(pick);
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pick", pick);
		map.put("page", (page - 1) * 10);
		

		listCount = stockService.stock_pick_count(map);
		List<StockVO> list = stockService.stock_pick_list(map);
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
	
	@RequestMapping("/admin/stockUpdate")
	public String stockUpdate(Model model, StockVO vo, HttpServletRequest request) {
		//model.addAttribute("stock_prdcode", vo.getStock_prdcode());
		String[] stock_220 = request.getParameterValues("stock_220");
		String[] stock_225 = request.getParameterValues("stock_225");
		String[] stock_230 = request.getParameterValues("stock_230");
		String[] stock_235 = request.getParameterValues("stock_235");
		String[] stock_240 = request.getParameterValues("stock_240");
		String[] stock_245 = request.getParameterValues("stock_245");
		String[] stock_250 = request.getParameterValues("stock_250");
		String[] stock_255 = request.getParameterValues("stock_255");
		String[] stock_260 = request.getParameterValues("stock_260");
		String[] stock_265 = request.getParameterValues("stock_265");
		String[] stock_270 = request.getParameterValues("stock_270");
		String[] stock_275 = request.getParameterValues("stock_275");
		String[] stock_280 = request.getParameterValues("stock_280");
		String[] stock_285 = request.getParameterValues("stock_285");
		String[] stock_290 = request.getParameterValues("stock_290");
		String[] total = request.getParameterValues("total");
		String[] stock_prdcode = request.getParameterValues("stock_prdcode");
		 
		ArrayList list = new ArrayList();
		
		int cnt = 0;
		for(String arr : stock_prdcode) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("stock_prdcode", stock_prdcode[cnt]);
			map.put("stock_220", stock_220[cnt]);
			map.put("stock_225", stock_225[cnt]);
			map.put("stock_230", stock_230[cnt]);
			map.put("stock_235", stock_235[cnt]);
			map.put("stock_240", stock_240[cnt]);
			map.put("stock_245", stock_245[cnt]);
			map.put("stock_250", stock_250[cnt]);
			map.put("stock_255", stock_255[cnt]);
			map.put("stock_260", stock_260[cnt]);
			map.put("stock_265", stock_265[cnt]);
			map.put("stock_270", stock_270[cnt]);
			map.put("stock_275", stock_275[cnt]);
			map.put("stock_280", stock_280[cnt]);
			map.put("stock_285", stock_285[cnt]);
			map.put("stock_290", stock_290[cnt]);
			map.put("total", total[cnt]);
			list.add(map);
			cnt++;
		}
		vo.setListMap(list);
		
		stockService.stock_update(vo);
		String referer = request.getParameter("referer");
		return "redirect:"+referer;
	}
	
	public String today() {

		SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();

		String today = Format.format(time).toString();

		return today;

	}

	public String lastmonth() {

		SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.MONTH, -1);
		String lastmonth = Format.format(cal.getTime());

		return lastmonth;
	}
	
	@RequestMapping("/admin/stockLog")
	public String getStockLog(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		

		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		
		String fieldName = "code";
		
		if(searchWord == null || searchWord.equals("")) {
			searchWord = "";
		}
		if(sdate == null || sdate.equals("")) {
			sdate = lastmonth();
		}
		if(edate == null || edate.equals("")) {
			edate = today();
		}
		if(pages !=null){
			page = Integer.parseInt(pages);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fieldName", fieldName);
		map.put("searchWord", searchWord);
		map.put("sdate", sdate);
		map.put("edate", edate);
		map.put("page", (page - 1) * 10);
		

		listCount = stockService.stock_log_count(map);
		List<StockLogVO> list = stockService.stock_log(map);
		model.addAttribute("stockLog", list);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);

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

		return "admin/stockUpdateLog";		
	}
	
	
	@RequestMapping(value = "/admin/stockInsert", method = RequestMethod.POST)
	public String stockInsert(StockVO vo) {
		stockService.stock_insert(vo);
		return "redirect:/admin/stockList";
	}
			
/*	@RequestMapping("/admin/stockEdit")
	public String stockEdit(Model model, @RequestParam String stock_prdcode) {
		model.addAttribute("stockInfo", stockService.stock_info(stock_prdcode));
		return "admin/stockEdit";
	}
*/ 			
			
	@RequestMapping("/admin/stockDelete")
	public String stockDelete(@RequestParam String picks, HttpServletRequest request) {
		stockService.stock_delete(picks);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
}
