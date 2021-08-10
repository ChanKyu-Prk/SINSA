package kr.co.sinsa.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sinsa.admin.service.FAQService;
import kr.co.sinsa.admin.vo.FAQVO;

@Controller
public class FAQController {
	
	@Inject
	FAQService faqService;
	
	@RequestMapping("/admin/faqList")
	public String getfaqList(Model model, HttpServletRequest requset) {
		System.out.println("faq넘오옴?111");
		List<FAQVO> list = faqService.faq_list();
		System.out.println("faq넘오옴?222");
		model.addAttribute("faqList", list);
		System.out.println("faq넘오옴?333");
		return "admin/faqList";
	}
	
	

}
