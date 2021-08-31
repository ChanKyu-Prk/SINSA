package kr.co.sinsa.view.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.customer.IndexService;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.orders.OrdersVO;
import kr.co.sinsa.biz.product.ProductVO;

@Controller
public class IndexController {

	@Autowired
	private IndexService IndexService;
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1(Model model) {
		
		List<ProductVO> productList = IndexService.getProductList();
		model.addAttribute("productList", productList);
		
		List<ReviewVO> reviewList = IndexService.getReviewList();
		model.addAttribute("reviewList", reviewList);
		
		List<ProductVO> topProductList = IndexService.getTopProductList();
		model.addAttribute("topProductList", topProductList);
		
		List<ProductVO> topSneakersProductList = IndexService.getTopSneakersProductList();
		model.addAttribute("topSneakersProductList", topSneakersProductList);
		
		
		List<ProductVO> topSportsProductList = IndexService.getTopSportsProductList();
		
		for(int i=0; i<topSportsProductList.size(); i++) {
			if(topSportsProductList.get(i) == null) {
				topSportsProductList.remove(i);
			}
		}
		
		model.addAttribute("topSportsProductList", topSportsProductList);
		System.out.println(topSportsProductList);
		
		return "index";
	}
}
