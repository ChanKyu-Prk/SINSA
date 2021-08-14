package kr.co.sinsa.view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sinsa.biz.user.CustomerVO;
import kr.co.sinsa.biz.user.LoginService;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginView(CustomerVO customerVO) {
		return "login";
	}

	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login(CustomerVO customerVO, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String CUS_ID = (String)request.getParameter("CUS_ID");
		String CUS_NAME = (String)request.getParameter("CUS_NAME");
		
		
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
			
			return "index";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();

			script.println("<script>alert('아이디 또는 비밀번호가 정확하지 않습니다.'); location.href='login.do';</script>");

			script.flush();
			
			return "login";
		}
		
	}
}
