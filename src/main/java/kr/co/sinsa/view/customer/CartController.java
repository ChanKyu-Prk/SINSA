package kr.co.sinsa.view.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.product.CartService;
import kr.co.sinsa.biz.product.CartVO;
import kr.co.sinsa.biz.product.DeleteCartListVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@SuppressWarnings("null")
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String getCartList(Model model, HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO)session.getAttribute("user");
		List<CartVO> cartList = cartService.getCartList(user);
		model.addAttribute("cartList", cartList);
		List<ProductVO> productList = cartService.getCartProductList(cartList);
		model.addAttribute("productList", productList);
		request.setAttribute("cartList", cartList);
		request.setAttribute("productList", productList);
		return "product/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String deleteCartList(Model model, HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO)session.getAttribute("user");
		int CART_PRDNUM = Integer.parseInt((String) request.getParameter("CART_PRDNUM"));
		DeleteCartListVO vo = new DeleteCartListVO();
		vo.setUserID(user.getCUS_ID());
		vo.setPrdNum(CART_PRDNUM);
		cartService.deleteCartList(vo);
		
		return "redirect:/cart.do";
	}
}
