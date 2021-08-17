package kr.co.sinsa.view.user;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.user.SNSLoginService;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class SNSLoginControlloer {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private SNSLoginService snsloginsvc;

	@RequestMapping(value = "/callBack", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		String naverID = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		System.out.println(response_obj);
		int cus_num = snsloginsvc.naverIdCheck(naverID);
		boolean emailCheck = snsloginsvc.emailCheck(email);
		if (cus_num != -1) {
			UserVO user = snsloginsvc.getUser(cus_num);
			session.setAttribute("user", user); // 세션 생성
			model.addAttribute("result", apiResult);
			return "index";
		} else if(emailCheck) {
			return "index";
		}
		else{
			CustomerVO vo = new CustomerVO();
			vo.setCUS_ID((String) response_obj.get("email"));
			vo.setCUS_BIRTH((String) response_obj.get("birthyear") + "-" + (String) response_obj.get("birthday"));
			vo.setCUS_EMAIL((String) response_obj.get("email"));
			String gender = (String) response_obj.get("gender");
			if ( gender.equals("M")) {
				gender = "남성";
			} else if (gender.equals("F")) {
				gender = "여성";
			} else {
				gender = "U";
			}
			vo.setCUS_GENDER(gender);
			vo.setCUS_NAME((String) response_obj.get("name"));
			String mobile = (String) response_obj.get("mobile");
			String[] mobileSplit = mobile.split("-");
			vo.setCUS_TEL(mobileSplit[0] + mobileSplit[1] + mobileSplit[2]);
			vo.setCUS_PWD("123123");
			vo.setCUS_ADDR("(      )||||");
			UserVO user = snsloginsvc.snsJoin(vo, naverID);
			session.setAttribute("user", user); // 세션 생성
			model.addAttribute("result", apiResult);
			return "index";
		}

	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:view/loginTest.jsp";
	}

}
