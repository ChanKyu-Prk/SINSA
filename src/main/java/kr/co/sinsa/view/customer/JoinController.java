package kr.co.sinsa.view.customer;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.JoinService;

@Controller
public class JoinController {


	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private JoinService joinService;

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		return "customer/join";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(CustomerVO vo, HttpServletRequest request) {
		vo.setCUS_BIRTH((String) request.getParameter("CUS_BIRTH_Date"));
		String email = request.getParameter("CUS_EMAIL_1") + "@" + request.getParameter("CUS_EMAIL_2");
		vo.setCUS_EMAIL(email);
		String address = "("+ request.getParameter("CUS_ADDR_1")+ ")|" + request.getParameter("CUS_ADDR_2")+"|"
				+ request.getParameter("CUS_ADDR_5") +"|"+request.getParameter("CUS_ADDR_4");
		vo.setCUS_ADDR(address);
		joinService.join(vo);
		return "redirect:/";
	}

	@RequestMapping(value = "/IdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String CUS_ID) throws Exception {

		int result = joinService.idCheck(CUS_ID);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	} // memberIdChkPOST() 종료

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email_1, String email_2) throws Exception {
		/* 인증번호(난수) 생성 */

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;


		String toMail = email_1 + "@" + email_2;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);

		return num;
	}
}
