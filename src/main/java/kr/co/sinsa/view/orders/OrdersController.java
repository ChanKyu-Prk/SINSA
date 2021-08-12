package kr.co.sinsa.view.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;


@Controller
public class OrdersController {
	@Autowired
	private OrdersSerivce service;
	
	@RequestMapping(value="/direct/checkout", method=RequestMethod.GET)
	public String cusInfo(Model model, @RequestParam(required=false, value="CUS_ID") String CUS_ID) {
		CustomerVO vo = service.cusInfoView(CUS_ID);
		System.out.println("VO: "+vo);
		model.addAttribute("cusInfo", vo);
		return "/orders/checkout";
	}
}
