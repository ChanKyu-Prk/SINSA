package kr.co.sinsa.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.admin.service.CustomerService;
import kr.co.sinsa.admin.vo.CustomerVO;
import kr.co.sinsa.biz.product.PageInfo;
import kr.co.sinsa.biz.product.ProductVO;

@Controller 
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	
	
	@RequestMapping(value = "/admin/customerList", method = RequestMethod.GET)
	public String getCustomerList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "CUS_NAME";
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
			listCount = customerService.customer_all_search_count(map);
			List<CustomerVO> list = customerService.customer_all_search(map);
			model.addAttribute("customerList", list);			
		} else {
			listCount = customerService.customer_list_count(map);
			List<CustomerVO> list = customerService.customer_list(map);
			model.addAttribute("customerList", list);
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

		return "admin/customerList";		
	}
	
	@RequestMapping("/admin/customerInfo")
	public String getCustomer(Model model, @RequestParam int CUS_NUM) {
		model.addAttribute("customerInfo", customerService.customer_info(CUS_NUM));
		return "admin/customerInfo";
	}
	
	@RequestMapping(value = "/admin/customerInputForm", method = RequestMethod.GET)
	public String customerInputForm(CustomerVO vo) {
		return "admin/customerInputForm";
	}
	
		@RequestMapping(value = "/admin/customerInsert", method = RequestMethod.POST)
		public String customerInsert(CustomerVO vo, HttpServletRequest req) {
			System.out.println("인덱스 화면으로 이동5555");
			//HttpServletRequest부터 cutomerService.join(vo)까지 수정함
			vo.setCUS_BIRTH((String) req.getParameter("CUS_BIRTH_Date"));
			String email = req.getParameter("CUS_EMAIL_1") + "@" + req.getParameter("CUS_EMAIL_2");
			vo.setCUS_EMAIL(email);
			String address = "("+ req.getParameter("CUS_ADDR_1")+ ")|" + req.getParameter("CUS_ADDR_2")+"|"
					+ req.getParameter("CUS_ADDR_5") + "|" + req.getParameter("CUS_ADDR_4");
			vo.setCUS_ADDR(address);
			customerService.customer_insert(vo);
			return "redirect:/admin/customerList";
		}
		
		@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String CUS_ID) throws Exception {

			int result = customerService.idCheck(CUS_ID);
			if (result != 0) {
				return "fail"; // 중복 아이디가 존재
			} else {
				return "success"; // 중복 아이디 x
			}

		}
		
		@RequestMapping(value = "/admin/mailChk", method = RequestMethod.POST)
		@ResponseBody
		public int mailChkPOST(Model model, String CUS_EMAIL_1, String CUS_EMAIL_2) throws Exception {
			System.out.println(CUS_EMAIL_1 + "aaaa" + CUS_EMAIL_2);
			String CUS_EMAIL = CUS_EMAIL_1+"@"+CUS_EMAIL_2;
			System.out.println(CUS_EMAIL + " 12123123123");
			int result = customerService.mailChk(CUS_EMAIL);
			return result;
		}
		
		@RequestMapping("/admin/customerEdit")
		public String customerEdit(Model model, @RequestParam int CUS_NUM) {
			model.addAttribute("customerInfo", customerService.customer_info(CUS_NUM));
			return "admin/customerEdit";
		}

		@RequestMapping("/admin/customerUpdate")
		public String customerUpdate(Model model, CustomerVO vo) {
			customerService.customer_update(vo);
			return "redirect:/admin/customerList";
		}
	
		@RequestMapping("/admin/customerDelete")
		public String customerDelete(@RequestParam int CUS_NUM) {
			customerService.customer_delete(CUS_NUM);
			return "redirect:/admin/customerList";
		}
}
