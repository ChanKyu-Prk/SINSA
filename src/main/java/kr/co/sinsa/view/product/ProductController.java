package kr.co.sinsa.view.product;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String getInfo(Model model, @PathVariable("prdCode") String PRD_CODE, HttpServletResponse response) {
		
    	ProductVO vo = service.info(PRD_CODE);
    	model.addAttribute("prdInfo", vo);
    	String prdnum = Integer.toString(vo.getPRD_NUM());
		Cookie recentlyViewed = new Cookie(prdnum,null);
		recentlyViewed.setPath("/");
		recentlyViewed.setMaxAge(0);
		response.addCookie(recentlyViewed);
		recentlyViewed = new Cookie(prdnum , prdnum);
		recentlyViewed.setPath("/");
		recentlyViewed.setMaxAge(60*60*24*3);
		response.addCookie(recentlyViewed);
    	
    	StockVO stockVO = stockService.sizeInStock(PRD_CODE);
    	model.addAttribute("stockInfo", stockVO);
    	
    	//조회 내역 모델에 저장 후 jsp에서 모델이 null이면 fa-heart-o

//    	List<ReviewVO> reviewVO = reviewDAO.reviewList(PRD_CODE);
//    	model.addAttribute("reviewInfo", reviewVO);

    	return "/product/product-details";
    }
	
	@RequestMapping("/direct/checkout")
    public String test1(Model model, String PRD_CODE) {
    	return "/orders/checkout";
    }
		
		
	@RequestMapping(value = "/getProductBrandPage")
	public String getProductBrandPage(Model model) {
		return "product/Product-brandPage";
	}
	
	@RequestMapping(value = "/getModal")
	public String getModal(Model model) {
		return "modaltest";
	}
	

	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/getProductListPage", method = RequestMethod.GET)
	public String getProductListPage(Model model, ProductVO vo,
			@RequestParam("num") int num,
			@RequestParam("condition") String condition,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "ShoeType", required = false, defaultValue = "") String ShoeType,
			@RequestParam(value = "white", required = false, defaultValue = "") String white,
			@RequestParam(value = "gray", required = false, defaultValue = "") String gray,
			@RequestParam(value = "red", required = false, defaultValue = "") String red,
			@RequestParam(value = "black", required = false, defaultValue = "") String black,
			@RequestParam(value = "blue", required = false, defaultValue = "") String blue,
			@RequestParam(value = "green", required = false, defaultValue = "") String green,
			@RequestParam(value = "minPrice", required = false, defaultValue = "") String minPrice,
			@RequestParam(value = "maxPrice", required = false, defaultValue = "") String maxPrice) throws Exception {

		vo.setMinamount(minPrice);
		vo.setMaxamount(maxPrice);
		vo.setWhite(white);
		vo.setGray(gray);
		vo.setRed(red);
		vo.setBlack(black);
		vo.setBlue(blue);
		vo.setGreen(green);

		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count(condition, vo));

		List<ProductVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum(), keyword, vo,
				condition);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("condition", condition);

		if (condition.equals("all")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countAll());

			list = service.listPageAll(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("sneakersForAll")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countSneakersForAll());


			list = service.listPageSneakersForAll(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		} else if (condition.equals("converseForAll")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countConverseForAll());


			list = service.listPageConverseForAll(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		}else if (condition.equals("slipOnForAll")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countSlip_onForAll());


			list = service.listPageSlip_onForAll(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		}else if (condition.equals("muleForAll")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countMuleForAll());


			list = service.listPageMuleForAll(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";
		}else if (condition.equals("men")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlyMen());


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


			list = service.listPageOnlyWomen(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("new")) {

			page = new Page();
			page.setNum(num);
			page.setCount(36);

			list = service.listPageNew(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("sneakersForNew")) {

			page = new Page();
			page.setNum(num);
			page.setCount(36);


			list = service.listPageSneakersForNew(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("converseForNew")) {

			page = new Page();
			page.setNum(num);
			page.setCount(36);


			list = service.listPageConverseForNew(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("slipOnForNew")) {

			page = new Page();
			page.setNum(num);
			page.setCount(36);


			list = service.listPageSlipOnForNew(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("muleForNew")) {

			page = new Page();
			page.setNum(num);
			page.setCount(36);


			list = service.listPageMuleForNew(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("best")) {

			page = new Page();
			page.setNum(num);
			page.setCount(12);


			list = service.listPageBestShoes(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("sneakersForBest")) {

			page = new Page();
			page.setNum(num);
			page.setCount(12);

			list = service.listPageBestSneakers(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("converseForBest")) {

			page = new Page();
			page.setNum(num);
			page.setCount(12);


			list = service.listPageBestConverse(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("slipOnForBest")) {

			page = new Page();
			page.setNum(num);
			page.setCount(12);


			list = service.listPageSlipOnForBest(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		}else if (condition.equals("muleForBest")) {

			page = new Page();
			page.setNum(num);
			page.setCount(12);


			list = service.listPageMuleForBest(page.getDisplayPost(), page.getPostNum(), keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("condition", condition);

			return "product/Product-listPage";

		} else if (condition.equals("onlySneakersForMen")) {

			page = new Page();
			page.setNum(num);
			page.setCount(service.countOnlySneakersForMen());


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
