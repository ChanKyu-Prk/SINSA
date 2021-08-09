package kr.co.sinsa.view.user;

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
	public String login(CustomerVO customerVO, Model model, HttpSession session) {


		if(customerVO.getCUS_ID() == null || customerVO.getCUS_ID().equals("")) {
			System.out.println("아이디는 반드시 입력해야 합니다.");
			return "login";
		}else if(customerVO.getCUS_PWD() == null || customerVO.getCUS_PWD().equals("")) {
			System.out.println("비밀번호는 반드시 입력해야 합니다.");
			return "login";
		}

		UserVO user = loginService.getUser(customerVO);
		if(user != null) {
			session.setAttribute("user", user);
//			model.addAttribute("user", user);
			return "index";
		}else {
			return "login";
		}
		
	}
}
