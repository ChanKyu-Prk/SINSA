package kr.co.sinsa.view.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.customer.CartVO;
import kr.co.sinsa.biz.customer.CustomerService;
import kr.co.sinsa.biz.customer.DeleteCartListVO;
import kr.co.sinsa.biz.customer.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@SuppressWarnings("null")
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String getCartList(Model model, HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO)session.getAttribute("user");
		
		List<CartVO> cartList = customerService.getCartList(user);
		model.addAttribute("cartList", cartList);
		
		List<ProductVO> productList = customerService.getCartProductList(cartList);
		model.addAttribute("productList", productList);
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("productList", productList);
		
		return "cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String deleteCartList(Model model, HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println(request.getParameter("CART_PRDNUM"));
		int CART_PRDNUM = Integer.parseInt((String) request.getParameter("CART_PRDNUM"));
		
		DeleteCartListVO vo = new DeleteCartListVO();
		vo.setUserID(user.getCUS_ID());
		vo.setPrdNum(CART_PRDNUM);
		
		customerService.deleteCartList(vo);
		
		return "redirect:/cart.do";
	}
	
	
}
