package kr.co.sinsa.view.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.customer.ReviewService;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService ReviewService;
	
	@RequestMapping(value="review-prdCode={prdCode}", method=RequestMethod.GET)
	public String getCartList(Model model, HttpSession session, @PathVariable("prdCode") String PRD_CODE, HttpServletRequest request) {
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		
		ProductVO productVO = ReviewService.getProductVO(PRD_CODE);
		model.addAttribute("productVO", productVO);
		
		List<ReviewVO> reviewList = ReviewService.getReviewList(PRD_CODE);
		model.addAttribute("reviewList", reviewList);
		
		return "/customer/reviewForm";
	}
}