package kr.co.sinsa.admin.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.admin.dao.CustomerDAO;
import kr.co.sinsa.admin.service.CustomerService;
import kr.co.sinsa.admin.vo.CustomerVO;

@Controller 
public class CustomerController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1(Model model) {
		System.out.println("인덱스 화면으로 이동11111");
		return "index";
	}
	
	
	@RequestMapping(value = "/admin/customerInputForm", method = RequestMethod.GET)
	public String customerInputForm(CustomerVO vo) {
		System.out.println("인덱스 화면으로 이동4444");
		return "admin/customerInputForm";
	}
	//여기부터
	@RequestMapping(value = "/admin/customerInsert", method = RequestMethod.POST)
	public String customerInsert(CustomerVO vo, HttpServletRequest req) {
		System.out.println("인덱스 화면으로 이동5555");
		//HttpServletRequest부터 cutomerService.join(vo)까지 수정함
		vo.setCUS_BIRTH((String) req.getParameter("CUS_BIRTH_Date"));
		String email = req.getParameter("CUS_EMAIL_1") + "@" + req.getParameter("CUS_EMAIL_2");
		vo.setCUS_EMAIL(email);
		String address = "("+ req.getParameter("CUS_ADDR_1")+ ")|" + req.getParameter("CUS_ADDR_2")+"|"
				+ req.getParameter("CUS_ADDR_5") + "|" + req.getParameter("CUS_ADDR_4");
		vo.setCUS_ADDR(address);
		customerService.insert(vo);
		
//		CusInsertDAO dao = sqlSessionTemplate.getMapper(CusInsertDAO.class);
//		int n = dao.customerInsert(vo);
		return "redirect:/admin/customerList";
	}
	
	@RequestMapping(value = "/cusIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String CUS_ID) throws Exception {

		int result = customerService.idCheck(CUS_ID);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	}
	@RequestMapping(value = "/cusmailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email_1, String email_2) throws Exception {
		/* 인증번호(난수) 생성 */
System.out.println("이메일111");
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		String setFrom = "sjinjin6@naver.com";
		String toMail = email_1 + "@" + email_2;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		System.out.println("이메일222");
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			System.out.println("이메일333");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이메일444");
		}
		String num = Integer.toString(checkNum);
		System.out.println("이메일5554");
		return num;
	}
	
	//여기까지 수정
	
//	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
//	public String home2(Model model) {
//		System.out.println("인덱스 화면으로 이동11111");
//		return "index";
//	}
	
	@RequestMapping("/admin/customerList")
	public String getCustomerList(Model model) {
		System.out.println("인덱스 화면으로 이동2222");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		List<CustomerVO> list = dao.CustomerList();
		System.out.println("인덱스 화면으로 이동2332");
		model.addAttribute("customerList", list);
		System.out.println("인덱스 화면으로 이동2442");
		return "admin/customerList";
	}
	
	@RequestMapping("/admin/customerInfo")
	public String getCustomer(Model model, @RequestParam int CUS_NUM) {
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		CustomerVO vo = dao.CustomerInfo(CUS_NUM);
		model.addAttribute("customerInfo", vo);
		System.out.println("인덱스 화면으로 이동3333");
		return "admin/customerInfo";
	}
	
	@RequestMapping("/admin/customerEdit")
	public String customerEdit(Model model, @RequestParam int CUS_NUM) {
		System.out.println("인덱스 화면으로 이동6000");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		CustomerVO vo = dao.CustomerInfo(CUS_NUM);
		System.out.println("인덱스 화면으로 이동6111");
		model.addAttribute("customerInfo", vo);
		System.out.println("인덱스 화면으로 이동6666");
		return "admin/customerEdit";
	}
	
	@RequestMapping("/admin/customerUpdate")
	public String customerUpdate(Model model, CustomerVO vo) {
		System.out.println("인덱스 화면으로 이동7777");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		int n = dao.CustomerUpdate(vo);
		model.addAttribute("CUS_NUM", vo.getCUS_NUM());
		return "redirect:/admin/customerEdit";
	}
	
	@RequestMapping("/admin/customerDelete")
	public String customerDelete(@RequestParam int CUS_NUM) {
		System.out.println("인덱스 화면으로 이동8888");
		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
		int n = dao.CustomerDelete(CUS_NUM);
		return "redirect:/admin/customerList";
	}
	
}
