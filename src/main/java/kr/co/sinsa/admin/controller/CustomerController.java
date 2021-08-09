package kr.co.sinsa.admin.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.dao.CustomerDAO;
import kr.co.sinsa.admin.vo.CustomerVO;

@Controller 
public class CustomerController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1(Model model) {
		System.out.println("인덱스 화면으로 이동11111");
		return "index";
	}
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home2(Model model) {
		System.out.println("인덱스 화면으로 이동11111");
		return "index";
	}
	
	@RequestMapping("/admin/customerList")
	public String getCustomerList(Model model) {
		System.out.println("인덱스 화면으로 이동2222");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		List<CustomerVO> list = dao.CustomerList();
		System.out.println("인덱스 화면으로 이동2332");
		model.addAttribute("customerList", list);
		System.out.println("인덱스 화면으로 이동2442");
		return "admin/customerList";
	}
	
	@RequestMapping("/admin/customerInfo")
	public String getCustomer(Model model, @RequestParam int CUS_NUM) {
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		CustomerVO vo = dao.CustomerInfo(CUS_NUM);
		model.addAttribute("customerInfo", vo);
		System.out.println("인덱스 화면으로 이동3333");
		return "admin/customerInfo";
	}
	
	@RequestMapping(value = "/admin/customerInputForm", method = RequestMethod.GET)
	public String customerInputForm(CustomerVO vo) {
		System.out.println("인덱스 화면으로 이동4444");
		return "admin/customerInputForm";
	}
	
	@RequestMapping(value = "/admin/customerInsert", method = RequestMethod.POST)
	public String customerInsert(CustomerVO vo) {
		System.out.println("인덱스 화면으로 이동5555");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		int n = dao.CustomerInsert(vo);
		return "redirect:/admin/customerList";
	}
	
	@RequestMapping("/admin/customerEdit")
	public String customerEdit(Model model, @RequestParam int CUS_NUM) {
		System.out.println("인덱스 화면으로 이동6000");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		CustomerVO vo = dao.CustomerInfo(CUS_NUM);
		System.out.println("인덱스 화면으로 이동6111");
		model.addAttribute("customerInfo", vo);
		System.out.println("인덱스 화면으로 이동6666");
		return "admin/customerEdit";
	}
	
	@RequestMapping("/admin/customerUpdate")
	public String customerUpdate(Model model, CustomerVO vo) {
		System.out.println("인덱스 화면으로 이동7777");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		int n = dao.CustomerUpdate(vo);
		model.addAttribute("CUS_NUM", vo.getCUS_NUM());
		return "redirect:/admin/customerEdit";
	}
	
	@RequestMapping("/admin/customerDelete")
	public String customerDelete(@RequestParam int CUS_NUM) {
		System.out.println("인덱스 화면으로 이동8888");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		int n = dao.CustomerDelete(CUS_NUM);
		return "redirect:/admin/customerList";
	}
	
}
