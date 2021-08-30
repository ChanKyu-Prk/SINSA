package kr.co.sinsa.view.orders;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.sinsa.biz.customer.CartVO;
import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.JjimVO;
import kr.co.sinsa.biz.customer.MyPageService;
import kr.co.sinsa.biz.orders.OrdersAndProductVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;
import kr.co.sinsa.biz.orders.OrdersVO;

import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO; 	


@Controller
@SessionAttributes("prdInfo")
public class OrdersController {
	@Autowired
	private OrdersSerivce service;
	
	@Autowired
	private ProductService proService;
	
	@Autowired
	private MyPageService myService;
	
	@RequestMapping(value = "/addCart", method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public String manageCart(@RequestBody List<Map<String, String>> itemLists, HttpServletResponse response, CartVO cartVO, Model model, HttpSession session) throws Exception {
		String CUS_ID = null;
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			CUS_ID = (String)user.getCUS_ID();
		}
		String ORDER_PRDCODE = null;;
				
		for(Object list : itemLists) {
			LinkedHashMap<String,String> item = (LinkedHashMap<String, String>) list;
			cartVO.setCART_CUSID(CUS_ID);
			ORDER_PRDCODE = item.get("ORDER_PRDCODE");
			OrdersAndProductVO oapVO = service.selPrdByCode(ORDER_PRDCODE);
			int CART_PRDNUM = oapVO.getPRD_NUM();
			cartVO.setCART_PRDNUM(CART_PRDNUM);
			cartVO.setCART_PRDSIZE(item.get("ORDER_PRDSIZE"));

			if(myService.selCartById(cartVO) == null) {
				myService.addCart(cartVO);
			} else {
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('이미 담겨있는 상품입니다 ');</script> ");
		        out.flush();
		        continue;
			}
			
		}
   
		return "redirect:/product/prdCode="+ORDER_PRDCODE;
	}
	
	@RequestMapping(value="/{access}/checkout", method=RequestMethod.GET)
	public String cusInfo(Model model, @PathVariable("access") String access, HttpSession session) throws Exception {
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			String CUS_ID = (String)user.getCUS_ID();
			CustomerVO vo = service.cusInfoView(CUS_ID);
			model.addAttribute("cusInfo", vo);
		} 
		if(access.equals("cart")) {
			model.addAttribute("isCart", "true");
		}else {
			model.addAttribute("isCart", "false");
		}
		return "/orders/checkout";
	}
	 
	@RequestMapping(value = "/{access}/checkout", method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public String details(@RequestBody List<Map<String, String>> itemLists, @PathVariable("access") String access, Model model) throws Exception {
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
	
	@RequestMapping(value = "/checkout/complete/orderNo={ORDER_NUM}", method=RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public String getPayComplete(Model model,@PathVariable("ORDER_NUM") String ORDER_NUM, OrdersVO ordersVO, HttpSession session) throws Exception {
		String CUS_ID = null;
		int totalPrice = 0;
		int usePoint = 0;
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			CUS_ID = (String)user.getCUS_ID();
		}
		ordersVO.setORDER_CUSID(CUS_ID);
		ordersVO.setORDER_NUM(ORDER_NUM);
		
		List<OrdersVO> orderInfo = service.selOrdersById(ordersVO);
		ProductVO prdVO = null;
		for(OrdersVO order : orderInfo) {
			prdVO = proService.info(order.getORDER_PRDCODE());
			totalPrice += order.getORDER_PRICE()*(1-(prdVO.getPRD_DISRATE()*0.01));
			usePoint = order.getORDER_USEPOINT();
		}
		totalPrice -= usePoint;
		model.addAttribute("ORDER_NUM", ORDER_NUM);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("usePoint",usePoint);
		
		model.addAttribute("prdInfo", "");
		return "/orders/payComplete";
	}
	
	@RequestMapping(value = "/checkout/process", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
	public String payComplete(@RequestBody List<Map<String, String>> itemLists, OrdersVO ordersVO, RedirectAttributes ra, HttpSession session, HttpServletResponse response) throws Exception {
		OrdersAndProductVO oapVO = null;
		List<String> orderList = new ArrayList();
		String CUS_ID = null;
		CustomerVO customerVO = null;
		String ORDER_NUM = null;
		String isCart = null;
		
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			CUS_ID = (String)user.getCUS_ID();
		}
		
		for(Object list : itemLists) {
			LinkedHashMap<String,String> item = (LinkedHashMap<String, String>) list;
			isCart = item.get("isCart");
			oapVO = service.selPrdByCode(item.get("ORDER_PRDCODE"));
			ORDER_NUM = item.get("ORDER_NUM");
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
		if(isCart.equals("true")) {
			myService.chckDeleteCart(CUS_ID);
		}
		return "redirect:/checkout/complete/orderNo="+ORDER_NUM;
	}
	
	@RequestMapping(value = "/jjim", method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public String manageJjim(@RequestBody LinkedHashMap<String,String> map, JjimVO jjimVO, Model model, HttpSession session) throws Exception {
		String CUS_ID = null;
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			CUS_ID = (String)user.getCUS_ID();
		}
		
		String ORDER_PRDCODE = map.get("ORDER_PRDCODE");
		ProductVO productVO = proService.info(ORDER_PRDCODE);		
		int PRD_NUM = productVO.getPRD_NUM();
		
		jjimVO.setJJIM_CUSID(CUS_ID);
		jjimVO.setJJIM_PRDNUM(PRD_NUM);
		
		if(myService.selJjimById(jjimVO) == null) {
			myService.addJjim(jjimVO);
		} else {
			myService.removeJjim(jjimVO);
		}
   
    return "redirect:/product/prdCode="+ORDER_PRDCODE;
	}
}
