package kr.co.sinsa.view.orders;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;
import kr.co.sinsa.biz.orders.OrdersVO;
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
	
	// 
	@RequestMapping(value = "/direct/checkout", method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public String details(@RequestBody Map<String, Object> map, Model model) {
		
		System.out.println("ORDERS : " + map);
//        String prdCode = orders.getORDER_PRDCODE();
//        System.out.println("orders : " + orders.getORDER_PRDCODE());
//        model.addAttribute("prdInfo", prdCode);
//
//        if (retrieveService.getdetail(orders) != null) {
//        }

    return "/orders/checkout";
}
}
