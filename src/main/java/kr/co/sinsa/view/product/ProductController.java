package kr.co.sinsa.view.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.biz.product.Page;
import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockService;
import kr.co.sinsa.biz.product.StockVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	private StockService stockService;
	
	// 상세페이지	
	@RequestMapping("/product/prdCode={prdCode}")
    public String getInfo(Model model, @PathVariable("prdCode") String PRD_CODE) {
    	ProductVO vo = service.info(PRD_CODE);
    	model.addAttribute("prdInfo", vo);
    	
    	StockVO stockVO = stockService.sizeInStock(PRD_CODE);
    	model.addAttribute("stockInfo", stockVO);
//    	
//    	List<ReviewVO> reviewVO = reviewDAO.reviewList(PRD_CODE);
//    	model.addAttribute("reviewInfo", reviewVO);

    	return "/product/product-details";
    }
	
		@RequestMapping("/direct/checkout")
	    public String test1(Model model, String PRD_CODE) {
	    	return "/orders/checkout";
	    }
		
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/getProductListPage", method = RequestMethod.GET)
	public String getProductListPage(Model model, @RequestParam("num") int num,
			@RequestParam("condition") String condition,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		System.out.println("condition ? " + condition);

		Page page = null;

		if (condition.equals("all")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countAll());

			List<ProductVO> list = null;
			list = service.listPageAll(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("men")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyMen());

			List<ProductVO> list = null;
			list = service.listPageOnlyMen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("women")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyWomen());

			List<ProductVO> list = null;
			list = service.listPageOnlyWomen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("new")) {

			page = new Page();
			page.setNum(num);
			page.setCount(30);

			List<ProductVO> list = null;
			list = service.listPageNew(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("best")) {

			page = new Page();
			page.setNum(num);
			page.setCount(12);

			List<ProductVO> list = null;
			list = service.listPageBestShoes(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("onlySneakersForMen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlySneakersForMen());

			List<ProductVO> list = null;
			list = service.listPageOnlySneakersForMen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlyConverseForMen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyConverseForMen());

			List<ProductVO> list = null;
			list = service.listPageOnlyConverseForMen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlyMuleForMen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyMuleForMen());

			List<ProductVO> list = null;
			list = service.listPageOnlyMuleForMen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlySlip-onForMen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlySlip_onForMen());

			List<ProductVO> list = null;
			list = service.listPageOnlySlip_onForMen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlySneakersForWomen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlySneakersForWomen());

			List<ProductVO> list = null;
			list = service.listPageOnlySneakersForWomen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlyConverseForWomen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyConverseForWomen());

			List<ProductVO> list = null;
			list = service.listPageOnlyConverseForWomen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlyMuleForWomen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyMuleForWomen());

			List<ProductVO> list = null;
			list = service.listPageOnlyMuleForWomen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("onlySlip-onForWomen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlySlip_onForWomen());

			List<ProductVO> list = null;
			list = service.listPageOnlySlip_onForWomen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		}
		return "product/Product-listPage";

	}

}
