package kr.co.sinsa.view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sinsa.biz.customer.IndexService;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.CustomerVO;
import kr.co.sinsa.biz.user.LoginService;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class LoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private IndexService IndexService;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	private LoginService loginService;

//	@RequestMapping(value="login.do", method=RequestMethod.GET)
//	public String loginGET(HttpServletRequest request) {
//		String referer = request.getHeader("Referer");
//		request.getSession().setAttribute("redirectURI", referer);
//		
//		return "/user/login";
//	}
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginView(CustomerVO customerVO, Model model, HttpSession session, HttpServletRequest request) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		System.out.println("네이버:" + naverAuthUrl); 
		model.addAttribute("url", naverAuthUrl);

		String referer = request.getHeader("Referer");
		String prevPage = referer.substring(referer.indexOf("/", referer.indexOf("/") + 2));
		System.out.println("prevPage : " + prevPage);
		model.addAttribute("prevPage", prevPage);
		
		return "login";
	}

	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login(CustomerVO customerVO, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String CUS_ID = (String)request.getParameter("CUS_ID");
		String CUS_NAME = (String)request.getParameter("CUS_NAME");
		String referer = (String)request.getParameter("referer");

		
		if(customerVO.getCUS_ID() == null || customerVO.getCUS_ID().equals("")) {
			return null;
		}else if(customerVO.getCUS_PWD() == null || customerVO.getCUS_PWD().equals("")) {
			return null;
		}

		UserVO user = loginService.getUser(customerVO);



		if(user != null) {
			session.setAttribute("user", user);
			model.addAttribute("user", user);

			Cookie cookie = null;
			String id = request.getParameter("CUS_ID");
			String pw = request.getParameter("CUS_PWD");
			String id_rem = request.getParameter("id_rem");
			String pwd_rem = request.getParameter("pwd_rem");

			if(id_rem != null && id_rem.trim().equals("on")) {
				cookie = new Cookie("CUS_ID", java.net.URLEncoder.encode(id));
				//				cookie.setDomain("localhost");
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
			}else {
				cookie = new Cookie("CUS_ID", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}


			if(pwd_rem != null && pwd_rem.trim().equals("on")) {
				cookie = new Cookie("CUS_PWD", java.net.URLEncoder.encode(pw));
				//				cookie.setDomain("localhost");
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
			}else {
				cookie = new Cookie("CUS_PWD", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			
			
			
			
			List<ProductVO> productList = IndexService.getProductList();
			model.addAttribute("productList", productList);
			
			List<ReviewVO> reviewList = IndexService.getReviewList();
			model.addAttribute("reviewList", reviewList);
			
			List<ProductVO> topProductList = IndexService.getTopProductList();
			model.addAttribute("topProductList", topProductList);
			
			List<ProductVO> topSneakersProductList = IndexService.getTopSneakersProductList();
			model.addAttribute("topSneakersProductList", topSneakersProductList);
			
			
			List<ProductVO> topSportsProductList = IndexService.getTopSportsProductList();
			
			if(referer != null) {
				return "redirect:"+referer;
			}
			
			if (request.getSession().getAttribute("requestURI") != null) {
				//http://localhost:8080/product/prdCode=ab1234
				return "redirect:request.getSession().getAttribute(\"requestURI\")";
			};
			
			for(int i=0; i<topSportsProductList.size(); i++) {
				if(topSportsProductList.get(i) == null) {
					topSportsProductList.remove(i);
				}
			}
			
			model.addAttribute("topSportsProductList", topSportsProductList);
			
			
			

			return "index";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();

			script.println("<script>alert('아이디 또는 비밀번호가 정확하지 않습니다.'); location.href='login.do';</script>");

			script.flush();

			return "login";
		}

	}

	@RequestMapping(value="/find_ID_PWD.do", method=RequestMethod.GET)
	public String findID(Model model){
		List<CustomerVO> customerList = loginService.getAllCustomerList();
		model.addAttribute("customerList", customerList);
		System.out.println("asdfadsfasdf");
		System.out.println(customerList.size());


		return "find_ID_PW";
	}




	@RequestMapping(value="/sendCodeForID.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendCodeForID(Model model, String CUS_NAME, String CUS_EMAIL, HttpServletResponse response) throws Exception{
		CustomerVO customerVO = new CustomerVO();

		customerVO.setCUS_NAME(CUS_NAME);
		customerVO.setCUS_EMAIL(CUS_EMAIL);

		String CUS_ID = ""; 
		CUS_ID = loginService.getCustomerID(customerVO);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		model.addAttribute("CUS_ID", CUS_ID);
		model.addAttribute("checkNum", checkNum);


		System.out.println("SDFSDF");
		System.out.println(CUS_ID);
		System.out.println(CUS_NAME);
		System.out.println(CUS_EMAIL);

		String setFrom = "sjinjin6@naver.com";
		String toMail = CUS_EMAIL;
		String title = "[SINSA]요청하신 아이디 찾기 인증번호를 확인해 주세요";
		String content = "홈페이지를 방문해주셔서 감사합니다." +"<br>" + "아이디 찾기 인증번호는" + checkNum + "입니다.";


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String code = Integer.toString(checkNum);
		return code;
	}



	@RequestMapping(value="/showID.do", method=RequestMethod.POST)
	@ResponseBody
	public String showID(Model model, String CUS_NAME, String CUS_EMAIL) {
		CustomerVO customerVO = new CustomerVO();

		customerVO.setCUS_NAME(CUS_NAME);
		customerVO.setCUS_EMAIL(CUS_EMAIL);

		String CUS_ID = ""; 
		
		CUS_ID = loginService.getCustomerID(customerVO);


		System.out.println("tttttt");
		System.out.println(CUS_ID);
		System.out.println(CUS_NAME);
		System.out.println(CUS_EMAIL);

		String setFrom = "sjinjin6@naver.com";
		String toMail = CUS_EMAIL;
		String title = "[SINSA]요청하신 아이디를 확인해 주세요";
		String content = "홈페이지를 방문해주셔서 감사합니다." +"<br>" + "회원님의 아이디는" + CUS_ID + "입니다.";


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return CUS_ID;
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/sendCodeForPW.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendCodeForPW(Model model, String CUS_ID, String CUS_NAME, String CUS_EMAIL, HttpServletResponse response) throws Exception{
		CustomerVO customerVO = new CustomerVO();

		customerVO.setCUS_ID(CUS_ID);
		customerVO.setCUS_NAME(CUS_NAME);
		customerVO.setCUS_EMAIL(CUS_EMAIL);

		String CUS_PWD = ""; 
		CUS_PWD = loginService.getCustomerPWD(customerVO);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		model.addAttribute("CUS_PWD", CUS_PWD);
//		model.addAttribute("checkNum", checkNum);


		System.out.println("PPPPPPPPPPP");
		System.out.println(CUS_ID);
		System.out.println(CUS_PWD);
		System.out.println(CUS_NAME);
		System.out.println(CUS_EMAIL);

		String setFrom = "sjinjin6@naver.com";
		String toMail = CUS_EMAIL;
		String title = "[SINSA]요청하신 비밀번호 찾기 인증번호를 확인해 주세요";
		String content = "홈페이지를 방문해주셔서 감사합니다." +"<br>" + "비밀번호 찾기 인증번호는" + checkNum + "입니다.";


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String code = Integer.toString(checkNum);
		return code;
	}







	@RequestMapping(value="/showPW.do", method=RequestMethod.POST)
	@ResponseBody
	public String showPW(Model model, String CUS_NAME, String CUS_ID, String CUS_EMAIL) throws Exception{
		CustomerVO customerVO = new CustomerVO();

		customerVO.setCUS_NAME(CUS_NAME);
		customerVO.setCUS_ID(CUS_ID);
		customerVO.setCUS_EMAIL(CUS_EMAIL);

		String CUS_PWD = loginService.getCustomerPWD(customerVO);

		String setFrom = "sjinjin6@naver.com";
		String toMail = CUS_EMAIL;
		String title = "[SINSA]요청하신 비밀번호를 확인해 주세요";
		String content = "홈페이지를 방문해주셔서 감사합니다." +"<br>" + "고객님의 비밀번호는 " + CUS_PWD + "입니다.";


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "CUS_PWD";
	}
}







