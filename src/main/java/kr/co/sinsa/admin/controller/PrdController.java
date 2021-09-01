package kr.co.sinsa.admin.controller;

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
import org.springframework.web.multipart.MultipartFile;

import kr.co.sinsa.admin.service.PrdFileUploadService;
import kr.co.sinsa.admin.service.PrdService;
import kr.co.sinsa.admin.vo.PrdVO;
import kr.co.sinsa.biz.product.PageInfo;

@Controller
public class PrdController {

	@Inject
	PrdService prdService;
	@Inject
	private PrdFileUploadService upload;
	
	@RequestMapping(value = "/admin/prdList", method = RequestMethod.GET)
	public String getPrdList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		if(fieldName == null || searchWord.equals("")) {
			fieldName = "prd_code";
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
			listCount = prdService.prd_all_search_count(map);
			List<PrdVO> list = prdService.prd_all_search(map);
			model.addAttribute("prdList", list);			
		} else {
			listCount = prdService.prd_list_count(map);
			List<PrdVO> list = prdService.prd_list(map);
			model.addAttribute("prdList", list);
		}

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

		return "admin/prdList";		
	}
		
	@RequestMapping("/admin/prdInfo")
	public String getPrd(Model model, @RequestParam String prd_code) {
//		PrdDAO dao = sqlSessionTemplate.getMapper(PrdDAO.class);
//		PrdVO vo = dao.prd_info(prd_num);
//		model.addAttribute("prdInfo", vo);
		model.addAttribute("prdInfo", prdService.prd_info(prd_code));
		return "admin/xprdInfo";
	}
			
	@RequestMapping(value = "/admin/prdInputForm", method = RequestMethod.GET)
	public String prdInputForm(PrdVO vo) {
		return "admin/prdInputForm";
	}
			
	@RequestMapping(value = "/admin/prdInsert", method = RequestMethod.POST)
	public String prdInsert(PrdVO vo, @RequestParam(required = false) List<MultipartFile> multipartFile) {
		
		if (multipartFile.get(0).isEmpty()) {
			prdService.prd_insert(vo);
		} else {
			String fileNames = upload.prdImgUpload(multipartFile);
			vo.setPrd_image(fileNames);
			prdService.prd_insert(vo);
		}
		return "redirect:/admin/prdList";
	}
			
	@RequestMapping("/admin/prdEdit")
	public String prdEdit(Model model, @RequestParam String prd_code) {

		model.addAttribute("prdInfo", prdService.prd_info(prd_code));
		return "admin/prdEdit";
	}
			
	@RequestMapping("/admin/prdUpdate")
	public String prdUpdate(HttpServletRequest request, Model model, PrdVO vo,
			@RequestParam(required = false) List<MultipartFile> multipartFile) {
		if (multipartFile.get(0).isEmpty()) {
			prdService.prd_update(vo);
		} else {
			String fileNames = upload.prdImgUpload(multipartFile);
			vo.setPrd_image(fileNames);
			prdService.prd_update(vo);
		}
		model.addAttribute("prd_code", vo.getPrd_code());
		String referer = request.getParameter("referer");
		return "redirect:"+referer;
	}
			
	@RequestMapping("/admin/prdDelete")
	public String prdDelete(HttpServletRequest request, @RequestParam String prd_code, Model model) {
		String stock = prdService.prd_delete_stock(prd_code);
		model.addAttribute("prdInfo", prdService.prd_info(prd_code));
		request.setAttribute("stock", stock);
		
		//prdService.prd_delete(prd_code);
		
		return "admin/prdDelete";
	}

	@RequestMapping("/admin/prdDeleteSuccess")
	public String prdDeleteSuccess(HttpServletRequest request, @RequestParam String prd_code) {
		prdService.prd_delete(prd_code);
		String referer = request.getParameter("referer");
		return "redirect:"+referer;
	}
	
}
