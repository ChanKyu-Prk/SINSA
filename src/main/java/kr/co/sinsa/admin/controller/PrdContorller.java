package kr.co.sinsa.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.service.PrdService;
import kr.co.sinsa.admin.vo.PrdVO;

@Controller
public class PrdContorller {

	@Inject
	PrdService prdService;

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Model model) {
//		System.out.println("인덱스 화면으로 이동11111");
//		return "index";
//	}

	
	@RequestMapping("/admin/prdList")
	public String getPrdList(Model model, HttpServletRequest request) {
		String fieldName = "all";
		String searchWord = "";
		if(request.getParameter("fieldName")!=null){
			fieldName=request.getParameter("fieldName");
		}
		if(request.getParameter("searchWord")!=null){
			searchWord=request.getParameter("searchWord");
		}
		request.setAttribute(fieldName, fieldName);
		request.setAttribute(searchWord, searchWord);
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		List<PrdVO> list = dao.prd_list();
		List<PrdVO> list = prdService.prd_list();
		model.addAttribute("prdList", list);
		return "admin/prdList";		
	}
		
	@RequestMapping("/admin/prdInfo")
	public String getPrd(Model model, @RequestParam int prd_num) {
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		PrdVO vo = dao.prd_info(prd_num);
//		model.addAttribute("prdInfo", vo);
		model.addAttribute("prdInfo", prdService.prd_info(prd_num));
		return "admin/xprdInfo";
	}
			
	@RequestMapping(value = "/admin/prdInputForm", method = RequestMethod.GET)
	public String prdInputForm(PrdVO vo) {
		return "admin/prdInputForm";
	}
			
	@RequestMapping(value = "/admin/prdInsert", method = RequestMethod.POST)
	public String prdInsert(PrdVO vo) {
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		int n = dao.prd_insert(vo);
		prdService.prd_insert(vo);
		return "redirect:/admin/prdList";
	}
			
	@RequestMapping("/admin/prdEdit")
	public String prdEdit(Model model, @RequestParam int prd_num) {
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		PrdVO vo = dao.prd_info(prd_num);
//		model.addAttribute("prdInfo", vo);
		model.addAttribute("prdInfo", prdService.prd_info(prd_num));
		return "admin/prdEdit";
	}
			
	@RequestMapping("/admin/prdUpdate")
	public String prdUpdate(Model model, PrdVO vo) {
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		int n = dao.prd_update(vo);
		model.addAttribute("prd_num", vo.getPrd_num());
		prdService.prd_update(vo);
		return "redirect:/admin/prdEdit";
	}
			
	@RequestMapping("/admin/prdDelete")
	public String prdDelete(@RequestParam int prd_num) {
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		int n = dao.prd_delete(prd_num);
		prdService.prd_delete(prd_num);
		return "redirect:/admin/prdList";
	}
	
}
