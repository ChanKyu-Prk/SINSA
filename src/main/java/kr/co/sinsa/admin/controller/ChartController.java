package kr.co.sinsa.admin.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.admin.service.ChartService;
import kr.co.sinsa.admin.vo.TopBrandVO;


@Controller

public class ChartController {

	

	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);

	@Autowired
	private ChartService ChartService;

	

	@RequestMapping(value = "/admin/adminIndex", method = RequestMethod.GET)
	public String dateIncome(Locale locale, Model model) {
		
		
		List<Integer> salesList = ChartService.getSalesList();
		model.addAttribute("salesList", salesList);
		
		List<Integer> dailySalesList = ChartService.getDailySalesList();
		model.addAttribute("dailySalesList", dailySalesList);
		System.out.println("dailySalesList" + dailySalesList);
		
		int year = ChartService.getYear();
		model.addAttribute("year", year);
		
		int totalSales = ChartService.getTotalSales();
		model.addAttribute("totalSales", totalSales);
		
		int totalSalesAmount = ChartService.getTotalSalesAmount();
		model.addAttribute("totalSalesAmount", totalSalesAmount);
		
		int totalQna = ChartService.getTotalQna();
		model.addAttribute("totalQna", totalQna);
		
		int totalUsers = ChartService.getTotalUsers();
		model.addAttribute("totalUsers", totalUsers);
		
		List<Integer> usersCountList = ChartService.getUsersCountList();
		model.addAttribute("usersCountList", usersCountList);
		
		
		List<TopBrandVO> topBrandList = ChartService.getTopBrandList();
		model.addAttribute("topBrandList", topBrandList);
		
		
		
		
		
		
		return "/admin/adminIndex";
	}



//	@RequestMapping(value = "incomeList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
//
//	@ResponseBody
//	public String incomeList(Locale locale, Model model) {
//
//		Gson gson = new Gson();
//		
//		List<ProductVO> list = ChartService.getProductList();
//		
//
//		return gson.toJson(list);
//
//	}



	

}