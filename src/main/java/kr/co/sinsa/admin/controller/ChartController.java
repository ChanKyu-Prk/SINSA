package kr.co.sinsa.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.sinsa.admin.service.ChartService;
import kr.co.sinsa.biz.product.ProductVO;


@Controller

public class ChartController {

	

	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);

	@Autowired
	private ChartService ChartService;

	

	@RequestMapping(value = "/admin/adminIndex", method = RequestMethod.GET)

	public String dateIncome(Locale locale, Model model) {

		return "/admin/adminIndex";
	}



	@RequestMapping(value = "incomeList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")

	@ResponseBody
	public String incomeList(Locale locale, Model model) {

		Gson gson = new Gson();
		
		List<ProductVO> list = ChartService.getProductList();
		

		return gson.toJson(list);

	}



	

}