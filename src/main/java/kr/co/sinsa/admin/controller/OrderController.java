package kr.co.sinsa.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.sinsa.admin.dao.CancelData;
import kr.co.sinsa.admin.service.IamportClient;
import kr.co.sinsa.admin.service.IamportResponse;
import kr.co.sinsa.admin.service.OrderService;
import kr.co.sinsa.admin.vo.OrderVO;
import kr.co.sinsa.admin.vo.Payment;
import kr.co.sinsa.biz.product.PageInfo;

@Controller
public class OrderController {

	@Inject
	OrderService orderService;
	

	public String today() {

		SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();

		String today = Format.format(time).toString();

		return today;

	}

	public String lastmonth() {

		SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.MONTH, -1);
		String lastmonth = Format.format(cal.getTime());

		return lastmonth;
	}

	@RequestMapping("/admin/orderList")
	public String getOrderList(Model model, @RequestParam(value = "page", required = false) String pages,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "fieldName", required = false) String fieldName,
			@RequestParam(value = "searchWord", required = false) String searchWord, OrderVO vo) {
		
		
		int page = 1;
		int limit = 10;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;

		if (fieldName == null || fieldName.equals("")) {
			fieldName = "order_num";
		}
		if (searchWord == null || searchWord.equals("")) {
			searchWord = "";
		}
		if (sdate == null || sdate.equals("")) {
			sdate = lastmonth();
		}
		if (edate == null || edate.equals("")) {
			edate = today();
		}
		if (pages != null) {
			page = Integer.parseInt(pages);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fieldName", fieldName);
		map.put("searchWord", searchWord);
		map.put("sdate", sdate);
		map.put("edate", edate);
		map.put("page", (page - 1) * 10);
		
		orderService.auto_complete();
		listCount = orderService.order_list_count(map);
		int cancelCount = orderService.order_cancel_count(map);
		List<OrderVO> list = orderService.order_list(map);
		model.addAttribute("orderList", list);
		
		int sales;
		int minus;
		int shippingreq = orderService.shippingreq();
		int cancelreq = orderService.cancelreq();
		
		if (listCount > 0) {
			sales = orderService.sales(map);
		} else {
			sales = 0;
		}
		
		if (cancelCount > 0 && searchWord != "취소요청") {
			minus = orderService.minus(map);
		} else {
			minus = 0;
		}
		
		model.addAttribute("sales", sales);
		model.addAttribute("minus", minus);
		model.addAttribute("shippingreq", shippingreq);
		model.addAttribute("cancelreq", cancelreq);
		model.addAttribute("allcount", listCount);
		model.addAttribute("cancelcount", cancelCount);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		
		model.addAttribute("orderInfo", vo);
		
		maxPage = (int) ((double) listCount / limit + 0.95);
		startPage = (((int) ((double) page / 5 + 0.8)) - 1) * 5 + 1;
		endPage = startPage + 9;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setEndPage(endPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		model.addAttribute("pageInfo", pageInfo);

		return "admin/orderList";
	}
	
	@RequestMapping("/admin/delivUpdate")
	public String delivUpdate(HttpServletRequest request, OrderVO vo) {
		
		orderService.deliv_update(vo);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("/admin/orderCancel")
	public String orderCancel(HttpServletRequest request, OrderVO vo, RedirectAttributes rttr) throws Exception {
		IamportClient client;

		String api_key = "1830448691401152";
		String api_secret = "d312640ec3ffac59888043ca53d4834031672d583ec9cff4c2a2b99c9b00aacb11c6b0392f14c010";

		client = new IamportClient(api_key, api_secret);
		
		String token = client.getToken();
		
		IamportResponse<Payment> paymentByMerchantUid = client.paymentByMerchantUid(vo.getOrder_num());
		
		int payment = paymentByMerchantUid.getResponse().getAmount() - paymentByMerchantUid.getResponse().getCancelAmount();
		int cancelAmount = vo.getOrder_price();
		
		if (payment <= 0) {
			rttr.addFlashAttribute("msg", "이미 전액 취소된 주문입니다.");
			
		} else if (cancelAmount < payment) {

			CancelData cancel2 = new CancelData(vo.getOrder_num(), false, cancelAmount);
			IamportResponse<Payment> cancelpayment2 = client.cancelPayment(cancel2);
			System.out.println(cancelpayment2.getMessage());

			rttr.addFlashAttribute("msg", "결제금액 " + payment + "원 중 " + cancelAmount + "원 부분 취소됩니다.");
			
			orderService.order_cancel(vo);
			
		} else if (cancelAmount >= payment) {
			
			CancelData cancel2 = new CancelData(vo.getOrder_num(), false);
			IamportResponse<Payment> cancelpayment2 = client.cancelPayment(cancel2);
			System.out.println(cancelpayment2.getMessage());
			
			rttr.addFlashAttribute("msg", payment + "원 전액 취소됩니다.");
			
			orderService.order_cancel(vo);
			
		} 


		String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
		
	}
	  
	  
}
