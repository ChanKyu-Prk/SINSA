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
		return "cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String deleteCartList(Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("111");
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("222");
		int CART_PRDNUM = Integer.parseInt((String) request.getParameter("CART_PRDNUM"));
		System.out.println("333");
		DeleteCartListVO vo = new DeleteCartListVO();
		System.out.println("444");
		vo.setUserID(user.getCUS_ID());
		System.out.println("555");
		vo.setPrdNum(CART_PRDNUM);
		System.out.println("666");
		cartService.deleteCartList(vo);
		System.out.println("777");
		
		return "redirect:/cart.do";
	}
	
	
}
