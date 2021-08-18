package kr.co.sinsa.view.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersAndProductVO;
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
			/*로그인 필요 confirm 창 띄우기*/
		} else {
			//회원 일시
			UserVO user = (UserVO) session.getAttribute("user");
			String CUS_ID = (String)user.getCUS_ID();
			CustomerVO vo = service.cusInfoView(CUS_ID);
			model.addAttribute("cusInfo", vo);
		}
		
		return "/orders/checkout";
	}
	
	// 
	@RequestMapping(value = "/direct/checkout", method=RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public String details(@RequestBody List<Map<String, String>> itemLists, Model model) throws Exception {
		String ORDER_PRDCODE = null;
		String ORDER_PRDSIZE = null;
		String ORDER_AMOUNT = null;
		OrdersAndProductVO oapVO = null;
		ArrayList<OrdersAndProductVO> prdList = new ArrayList();
				
		int index = 0;
		for(Object list : itemLists) {
//			System.out.println(list);
			LinkedHashMap<String,String> item = (LinkedHashMap<String, String>) list;
			System.out.println("index : " + index);
			System.out.println(item.get("ORDER_PRDCODE"));
//			oapVO = service.selPrdByCode(item.get("ORDER_PRDCODE"));
//			prdList.add(oapVO);
			
			System.out.println(item.get("ORDER_PRDSIZE"));
			System.out.println(item.get("ORDER_AMOUNT"));
			index++;
		}
		
//		model.addAttribute("prdInfo", prdList);

		
//        String prdCode = orders.getORDER_PRDCODE();
//        System.out.println("orders : " + orders.getORDER_PRDCODE());
//        model.addAttribute("prdInfo", prdCode);
//
//        if (retrieveService.getdetail(orders) != null) {
//        }

    return "/orders/checkout";
}
}
