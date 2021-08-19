package kr.co.sinsa.admin.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.service.OrderService;
import kr.co.sinsa.admin.vo.OrderVO;
import kr.co.sinsa.biz.product.PageInfo;

@Controller
public class OrderContorller {

	@Inject
	OrderService orderService;

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

	@RequestMapping("/admin/orderList")
	public String getOrderList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord, OrderVO vo) {

		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (fieldName == null || fieldName.equals("")) {
			fieldName = "order_num";
		}
		if (searchWord == null || searchWord.equals("")) {
			searchWord = "";
		}
		if (sdate == null || sdate.equals("")) {
			sdate = lastmonth();
		}
		if (edate == null || edate.equals("")) {
			edate = today();
		}
		if (pages != null) {
			page = Integer.parseInt(pages);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fieldName", fieldName);
		map.put("searchWord", searchWord);
		map.put("sdate", sdate);
		map.put("edate", edate);
		map.put("page", (page - 1) * 10);

		listCount = orderService.order_list_count(map);
		List<OrderVO> list = orderService.order_list(map);
		model.addAttribute("orderList", list);

		int sales = orderService.sales(map);
		int shippingreq = orderService.shippingreq();
		int cancelreq = orderService.cancelreq();
		model.addAttribute("sales", sales);
		model.addAttribute("shippingreq", shippingreq);
		model.addAttribute("cancelreq", cancelreq);
		model.addAttribute("allcount", listCount);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		
		model.addAttribute("orderInfo", vo);
		
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

		return "admin/orderList";
	}
	
	@RequestMapping("/admin/delivUpdate")
	public String stockUpdate(HttpServletRequest request, OrderVO vo) {
		
		orderService.deliv_update(vo);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	  
	  
	/*
	 * @RequestMapping(value = "/admin/stockAdd", method = RequestMethod.POST)
	 * public String stockInputForm(HttpServletRequest request, Model model, StockVO
	 * vo) {
	 * 
	 * String pick = request.getParameter("picks"); System.out.println(pick);
	 * 
	 * int page = 1; int limit = 10; int listCount; int startPage; int endPage; int
	 * maxPage;
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>(); map.put("pick",
	 * pick); map.put("page", (page - 1) * 10);
	 * 
	 * listCount = stockService.stock_pick_count(map); List<StockVO> list =
	 * stockService.stock_pick_list(map); model.addAttribute("stockList", list);
	 * 
	 * model.addAttribute("stockInfo", vo);
	 * 
	 * maxPage = (int) ((double) listCount / limit + 0.95); startPage = (((int)
	 * ((double) page / 5 + 0.8)) - 1) * 5 + 1; endPage = startPage + 4; if (endPage
	 * > maxPage) { endPage = maxPage; } PageInfo pageInfo = new PageInfo();
	 * pageInfo.setListCount(listCount); pageInfo.setEndPage(endPage);
	 * pageInfo.setStartPage(startPage); pageInfo.setMaxPage(maxPage);
	 * pageInfo.setPage(page); model.addAttribute("pageInfo", pageInfo);
	 * 
	 * return "admin/stockAddForm"; }
	 * 
	 * @RequestMapping(value = "/admin/stockInsert", method = RequestMethod.POST)
	 * public String stockInsert(StockVO vo) { stockService.stock_insert(vo); return
	 * "redirect:/admin/stockList"; }
	 * 
	 * @RequestMapping("/admin/stockEdit") public String stockEdit(Model
	 * model, @RequestParam String stock_prdcode) { model.addAttribute("stockInfo",
	 * stockService.stock_info(stock_prdcode)); return "admin/stockEdit"; }
	 * 
	 * 
	 * @RequestMapping("/admin/stockDelete") public String stockDelete(@RequestParam
	 * String stock_prdcode) { stockService.stock_delete(stock_prdcode); return
	 * "redirect:/admin/stockList"; }
	 */
}
