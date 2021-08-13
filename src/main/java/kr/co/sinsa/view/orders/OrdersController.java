package kr.co.sinsa.view.orders;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;
import kr.co.sinsa.biz.user.UserVO; 	


@Controller
public class OrdersController {
	@Autowired
	private OrdersSerivce service;
	
	@RequestMapping(value="/direct/checkout", method=RequestMethod.GET)
	public String cusInfo(Model model, HttpSession session) throws Exception {
		String page = null;
		
		if((UserVO) session.getAttribute("user") == null) {
			//비회원 일시
			page = "/orders/checkoutGuest";
		} else {
			//회원 일시
			UserVO user = (UserVO) session.getAttribute("user");
			String CUS_ID = (String)user.getCUS_ID();
			CustomerVO vo = service.cusInfoView(CUS_ID);
			model.addAttribute("cusInfo", vo);
			
			page = "/orders/checkout";
		}
		
		return page;
	}
}
