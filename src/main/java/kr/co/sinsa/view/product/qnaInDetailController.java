package kr.co.sinsa.view.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.biz.product.PageInfo;
import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.QnaService;
import kr.co.sinsa.biz.product.QnaVO;

@Controller
public class qnaInDetailController {
	@Autowired
	private ProductService service;
	@Autowired
	private QnaService QnaService;
	
	@ResponseBody
	@RequestMapping(value = "/qnaListForm", method=RequestMethod.POST)
	public Map<String, Object> qnaListForm(Model model, String prdCode, String pageR)
	{
		System.out.println("page : " + pageR); // 페이지번호 가져오기 성공
		System.out.println("prdCode : " + prdCode); //상품 코드 가져오기 성공
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO productVO = service.info(prdCode);
		int qna_PRD_NUM = productVO.getPRD_NUM();
		int page = Integer.parseInt(pageR);
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		
		map.put("qna_PRD_NUM", qna_PRD_NUM);
		map.put("page", (page - 1) * limit);
		List<QnaVO> qnaList = QnaService.qnaInfo(map);
		System.out.println(qnaList.get(0).getQNA_REGDATE());
		listCount = service.countQNAList(map);
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
		map.put("pageInfo", pageInfo);
		map.put("qnaList", qnaList);
		
		return map;
	}

	
}
