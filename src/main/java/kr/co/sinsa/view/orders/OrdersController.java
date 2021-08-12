package kr.co.sinsa.view.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.sinsa.biz.orders.OrdersService;


@Controller
public class OrdersController {
	@Autowired
	private OrdersService service;
	
	
}
