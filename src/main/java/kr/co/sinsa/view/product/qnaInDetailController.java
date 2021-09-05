package kr.co.sinsa.view.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.biz.product.PageInfo;
import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.QnaService;
import kr.co.sinsa.biz.product.QnaVO;
import kr.co.sinsa.biz.user.UserVO;

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
		listCount = service.countQNAList(map);
		System.out.println("listCount : " + listCount);
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
	
	@ResponseBody
	@RequestMapping(value = "/formToInput/{CRUD}", method = RequestMethod.POST)
	public Map<String, Object> formToInput(Model model, QnaVO vo, HttpSession session,
			@PathVariable("CRUD") String CRUD){
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO) session.getAttribute("user");
		if(CRUD.equals("insert")) {
			int PRD_NUM = vo.getPRD_NUM();
			String QNA_CUSID = (String)user.getCUS_ID();
			String QNA_TITLE = vo.getQNA_TITLE(); 
			int QNA_LOCK = vo.getQNA_LOCK(); 
			String QNA_CONTENT = vo.getQNA_CONTENT();
			
			map.put("PRD_NUM", PRD_NUM);
			map.put("QNA_LOCK", QNA_LOCK);
			map.put("QNA_CUSID", QNA_CUSID);
			map.put("QNA_TITLE", QNA_TITLE);
			map.put("QNA_CONTENT", QNA_CONTENT);
			
			QnaService.insertQNA(map);
			
			QnaVO vo2 = QnaService.selectQNA(QNA_CUSID);
			int QNA_NUM = vo2.getQNA_NUM();
			PRD_NUM = vo2.getPRD_NUM();
			QNA_CUSID = vo2.getQNA_CUSID();
			QNA_TITLE = vo2.getQNA_TITLE();
			QNA_LOCK = vo2.getQNA_LOCK();
			QNA_CONTENT = vo2.getQNA_CONTENT();
			
			map.put("QNA_NUM", QNA_NUM);
			map.put("PRD_NUM", PRD_NUM);
			map.put("QNA_LOCK", QNA_LOCK);
			map.put("QNA_CUSID", QNA_CUSID);
			map.put("QNA_TITLE", QNA_TITLE);
			map.put("QNA_CONTENT", QNA_CONTENT);
			
			return map;
		}else if(CRUD.equals("delete")) {
			int QNA_NUM = vo.getQNA_NUM();
			map.put("QNA_NUM", QNA_NUM);
			QnaService.deleteQNA(map);
		}else if(CRUD.equals("update")) {
			int PRD_NUM = vo.getPRD_NUM();
			int QNA_NUM = vo.getQNA_NUM();
			String QNA_CUSID = (String)user.getCUS_ID();
			String QNA_TITLE = vo.getQNA_TITLE(); 
			int QNA_LOCK = vo.getQNA_LOCK(); 
			String QNA_CONTENT = vo.getQNA_CONTENT();

			map.put("PRD_NUM", PRD_NUM);
			map.put("QNA_LOCK", QNA_LOCK);
			map.put("QNA_CUSID", QNA_CUSID);
			map.put("QNA_TITLE", QNA_TITLE);
			map.put("QNA_CONTENT", QNA_CONTENT);
			map.put("QNA_NUM", QNA_NUM);
			
			QnaService.updateQNA(map);
		}
		return map;
	}
}
