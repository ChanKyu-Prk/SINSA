package kr.co.sinsa.view.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.sinsa.biz.orders.OrdersSerivce;


@Controller
public class OrdersController {
	@Autowired
	private OrdersSerivce service;
	

}
