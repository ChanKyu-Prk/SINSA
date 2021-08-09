package kr.co.sinsa.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.service.StockService;
import kr.co.sinsa.admin.vo.StockVO;

@Controller
public class StockContorller {
	
	@Inject
	StockService stockService;

	@RequestMapping("/admin/stockList")
	public String getStockList(Model model) {
		List<StockVO> list = stockService.stock_list();
		model.addAttribute("stockList", list);
		return "admin/stockList";		
	}
	
	@RequestMapping("/admin/stockInfo")
	public String getStock(Model model, @RequestParam String stock_prdcode) {
		model.addAttribute("stockInfo", stockService.stock_info(stock_prdcode));
		return "admin/stockInfo";
	}
			
	@RequestMapping(value = "/admin/stockAdd", method = RequestMethod.GET)
	public String stockInputForm(Model model, StockVO vo) {
		List<StockVO> list = stockService.stock_list();
		model.addAttribute("stockList", list);
		model.addAttribute("stockInfo", vo);
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
