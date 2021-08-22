package kr.co.sinsa.view.orders;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersAndProductVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;
import kr.co.sinsa.biz.orders.OrdersVO;
import kr.co.sinsa.biz.user.UserVO; 	


@Controller
@SessionAttributes("prdInfo")
public class OrdersController {
	@Autowired
	private OrdersSerivce service;
	
	@RequestMapping(value="/direct/checkout", method=RequestMethod.GET)
	public String cusInfo(Model model, HttpSession session) throws Exception {
		
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			String CUS_ID = (String)user.getCUS_ID();
			CustomerVO vo = service.cusInfoView(CUS_ID);
			model.addAttribute("cusInfo", vo);
		} 
		return "/orders/checkout";
	}
	 
	@RequestMapping(value = "/direct/checkout", method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public String details(@RequestBody List<Map<String, String>> itemLists, Model model) throws Exception {
		String ORDER_PRDCODE = null;
		String ORDER_PRDSIZE = null;
		String ORDER_AMOUNT = null;
		OrdersAndProductVO oapVO = null;
		List<OrdersAndProductVO> prdList = new ArrayList();
				
		for(Object list : itemLists) {
			LinkedHashMap<String,String> item = (LinkedHashMap<String, String>) list;
			oapVO = service.selPrdByCode(item.get("ORDER_PRDCODE"));
			oapVO.setORDER_AMOUNT(Integer.parseInt(item.get("ORDER_AMOUNT")));
			oapVO.setORDER_PRDSIZE(item.get("ORDER_PRDSIZE"));
			prdList.add(oapVO);
		}
		model.addAttribute("prdInfo", prdList);

    return "/orders/checkout";
	}
	
	@RequestMapping(value = "/checkout/complete", method=RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public String getPayComplete(Model model) throws Exception {
	System.out.println("GET");
    return "/orders/payComplete";
	}
	
	@RequestMapping(value = "/checkout/complete", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
	public String payComplete(@RequestBody List<Map<String, String>> itemLists, OrdersVO ordersVO, RedirectAttributes ra, HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("POST");
		OrdersAndProductVO oapVO = null;
		List<String> orderList = new ArrayList();
		String CUS_ID = null;
		CustomerVO customerVO = null;
		
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			CUS_ID = (String)user.getCUS_ID();
		}
		
		for(Object list : itemLists) {
			LinkedHashMap<String,String> item = (LinkedHashMap<String, String>) list;
			oapVO = service.selPrdByCode(item.get("ORDER_PRDCODE"));
			ordersVO.setORDER_NUM(item.get("ORDER_NUM"));
			ordersVO.setORDER_CUSID(CUS_ID);
			ordersVO.setORDER_PRDCODE(item.get("ORDER_PRDCODE"));
			ordersVO.setORDER_PRDNAME(oapVO.getPRD_NAME());
			ordersVO.setORDER_PRDSIZE(item.get("ORDER_PRDSIZE"));
			ordersVO.setORDER_AMOUNT(Integer.parseInt(item.get("ORDER_AMOUNT")));
			ordersVO.setORDER_RECEIVER(item.get("ORDER_RECEIVER"));
			ordersVO.setORDER_TEL(item.get("ORDER_TEL"));
			ordersVO.setORDER_ADDR(item.get("ORDER_ADDR"));
			ordersVO.setORDER_PRICE(oapVO.getPRD_PRICE()*Integer.parseInt(item.get("ORDER_AMOUNT")));
			ordersVO.setORDER_MEMO(item.get("ORDER_MEMO"));
			ordersVO.setORDER_USEPOINT(Integer.parseInt(item.get("ORDER_USEPOINT")));
			service.addOrders(ordersVO);
		}
		
		//usePoint service
		customerVO = service.cusInfoView(CUS_ID);
		customerVO.setCUS_ID(CUS_ID);
		customerVO.setCUS_POINT(customerVO.getCUS_POINT()-ordersVO.getORDER_USEPOINT());
		service.chkUsePoint(customerVO);
		
		//ORDER_CUSID, ORDER_NUM 전송
		orderList.add(ordersVO.getORDER_CUSID());
		orderList.add(ordersVO.getORDER_NUM());
		ra.addFlashAttribute("ordersInfo", orderList);

		return "redirect:/orders/payComplete";
	}
}
