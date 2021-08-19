package kr.co.sinsa.view.orders;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.orders.OrdersAndProductVO;
import kr.co.sinsa.biz.orders.OrdersSerivce;
import kr.co.sinsa.biz.user.UserVO; 	


@Controller
@SessionAttributes("prdInfo")
public class OrdersController {
	@Autowired
	private OrdersSerivce service;
	
	@RequestMapping(value="/direct/checkout", method=RequestMethod.GET)
	public String cusInfo(Model model, HttpSession session) throws Exception {
		
		if((UserVO) session.getAttribute("user") == null) {
			//비회원 일시
			CustomerVO vo = service.cusInfoView("dhan03");
			model.addAttribute("cusInfo", vo);
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
}
