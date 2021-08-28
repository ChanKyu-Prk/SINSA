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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@SuppressWarnings("null")
//	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
//	public String getCartList(Model model, HttpSession session, HttpServletRequest request, HttpServletRequest response) {
//
//		UserVO user = (UserVO)session.getAttribute("user");
//		List<CartVO> cartList = cartService.getCartList(user);
//		model.addAttribute("user", user);
//		model.addAttribute("cartList", cartList);
//		
//		List<ProductVO> productList = cartService.getCartProductList(cartList);
//		model.addAttribute("productList", productList);
//		
//		List<StockVO> stockList = cartService.getCartStockList(productList);
//		model.addAttribute("stockList", stockList);
//		
//		List<UserCartProductStockVO> userCartProductStockList = new ArrayList<UserCartProductStockVO>();
//		
//		for(int i=0; i<cartList.size(); i++) {
//			
//			UserCartProductStockVO userCartProductStockVO = new UserCartProductStockVO();
//			userCartProductStockVO.setCART_CUSID(cartList.get(i).getCART_CUSID());
//			userCartProductStockVO.setCART_NUM(cartList.get(i).getCART_NUM());
//			userCartProductStockVO.setCART_PRDCOUNT(cartList.get(i).getCART_PRDCOUNT());
//			userCartProductStockVO.setCART_PRDNUM(cartList.get(i).getCART_PRDNUM());
//			userCartProductStockVO.setCART_PRDSIZE(cartList.get(i).getCART_PRDSIZE());
//			userCartProductStockVO.setCART_REGDATE(cartList.get(i).getCART_REGDATE());
//			userCartProductStockVO.setCUS_ID(user.getCUS_ID());
//			userCartProductStockVO.setCUS_NAME(user.getCUS_NAME());
//			userCartProductStockVO.setPRD_BRAND(productList.get(i).getPRD_BRAND());
//			userCartProductStockVO.setPRD_CATEGORY(productList.get(i).getPRD_CATEGORY());
//			userCartProductStockVO.setPRD_CODE(productList.get(i).getPRD_CODE());
//			userCartProductStockVO.setPRD_COLOR(productList.get(i).getPRD_COLOR());
//			userCartProductStockVO.setPRD_DETAIL(productList.get(i).getPRD_DETAIL());
//			userCartProductStockVO.setPRD_DISRATE(productList.get(i).getPRD_DISRATE());
//			userCartProductStockVO.setPRD_GENDER(productList.get(i).getPRD_GENDER());
//			userCartProductStockVO.setPRD_IMAGE(productList.get(i).getPRD_IMAGE());
//			userCartProductStockVO.setPRD_NAME(productList.get(i).getPRD_NAME());
//			userCartProductStockVO.setPRD_NUM(productList.get(i).getPRD_NUM());
//			userCartProductStockVO.setPRD_PRICE(productList.get(i).getPRD_PRICE());
//			userCartProductStockVO.setSTOCK_220(stockList.get(i).getSTOCK_220());
//			userCartProductStockVO.setSTOCK_225(stockList.get(i).getSTOCK_225());
//			userCartProductStockVO.setSTOCK_230(stockList.get(i).getSTOCK_230());
//			userCartProductStockVO.setSTOCK_235(stockList.get(i).getSTOCK_235());
//			userCartProductStockVO.setSTOCK_240(stockList.get(i).getSTOCK_240());
//			userCartProductStockVO.setSTOCK_245(stockList.get(i).getSTOCK_245());
//			userCartProductStockVO.setSTOCK_250(stockList.get(i).getSTOCK_250());
//			userCartProductStockVO.setSTOCK_255(stockList.get(i).getSTOCK_255());
//			userCartProductStockVO.setSTOCK_260(stockList.get(i).getSTOCK_260());
//			userCartProductStockVO.setSTOCK_265(stockList.get(i).getSTOCK_265());
//			userCartProductStockVO.setSTOCK_270(stockList.get(i).getSTOCK_270());
//			userCartProductStockVO.setSTOCK_275(stockList.get(i).getSTOCK_275());
//			userCartProductStockVO.setSTOCK_280(stockList.get(i).getSTOCK_280());
//			userCartProductStockVO.setSTOCK_285(stockList.get(i).getSTOCK_285());
//			userCartProductStockVO.setSTOCK_290(stockList.get(i).getSTOCK_290());
//			userCartProductStockVO.setSTOCK_PRDCODE(stockList.get(i).getSTOCK_PRDCODE());
//			
//			userCartProductStockList.add(userCartProductStockVO);
//		}
//		model.addAttribute("userCartProductStockList", userCartProductStockList);
//		
//		request.setAttribute("cartList", cartList);
//		request.setAttribute("productList", productList);
//		request.setAttribute("userCartProductStockList", userCartProductStockList);
//		
//		return "product/cart";
//	}
//	
//	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
//	public String deleteCartList(UserCartProductStockVO userCartProductStockVO, Model model, HttpSession session, HttpServletRequest request){
//		
//		UserVO user = (UserVO)session.getAttribute("user");
////		int CART_PRDNUM = Integer.parseInt((String) request.getParameter("CART_PRDNUM"));
////		
////		DeleteCartListVO vo = new DeleteCartListVO();
////		vo.setUserID(user.getCUS_ID());
////		vo.setPrdNum(CART_PRDNUM);
//		
//		System.out.println(userCartProductStockVO.getCART_PRDSIZE());
//		System.out.println(userCartProductStockVO.getCART_PRDNUM());
//		System.out.println(userCartProductStockVO.getCUS_ID());
//		
//		cartService.deleteCartList(userCartProductStockVO);
//		
//		return "redirect:/cart.do";
//	}
//	
//	
//	@RequestMapping(value="/deleteAllCart.do", method=RequestMethod.POST)
//	public String deleteAll(UserCartProductStockVO userCartProductStockVO, Model model, HttpSession session) {
//		UserVO user = (UserVO)session.getAttribute("user");
//		userCartProductStockVO.setCUS_ID(user.getCUS_ID());
//		System.out.println(userCartProductStockVO);
//		
//		cartService.deleteAll(userCartProductStockVO);
//
//		
//		return "redirect:/cart.do";
//	}
//	
//	
//	
//	@RequestMapping(value="/updatecart.do", method=RequestMethod.POST)
//	public String updateCount(UserCartProductStockVO userCartProductStockVO, Model model, HttpSession session) {
//		UserVO user = (UserVO)session.getAttribute("user");
//		userCartProductStockVO.setCUS_ID(user.getCUS_ID());
//		System.out.println(userCartProductStockVO);
//		
//		cartService.updateCartProductCount(userCartProductStockVO);
//
//		return "redirect:/cart.do";
//	}
//	
//	@RequestMapping(value="/updatesize.do", method=RequestMethod.POST)
//	@ResponseBody
//	public int updateSize(UserCartProductStockVO userCartProductStockVO, Model model, HttpSession session) {
//		UserVO user = (UserVO)session.getAttribute("user");
//		userCartProductStockVO.setCUS_ID(user.getCUS_ID());
//		System.out.println(userCartProductStockVO);
//		
//		int checkNum = cartService.updateSize(userCartProductStockVO);
//
//		return checkNum;
//	}
}
