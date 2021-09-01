package kr.co.sinsa.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.dao.AdminDAO;
import kr.co.sinsa.admin.dao.CustomerDAO;
import kr.co.sinsa.admin.vo.AdminVO;
import kr.co.sinsa.admin.vo.CustomerVO;

@Controller
public class AdminController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private AdminDAO Adao;

	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String getAdminLogin(AdminVO vo) {
		return "admin/adminLogin";
	}

	@RequestMapping(value = "/adminLoginOk", method = RequestMethod.POST)
	public String AdminLoginOk(Model model, @RequestParam("ADID") String adid, @RequestParam("ADPW") String adpw,
			HttpServletRequest req) {

//		CustomerDAO dao = sqlSessionTemplate.getMapper(CustomerDAO.class);
//		List<CustomerVO> list = dao.CustomerList();
//		model.addAttribute("customerList", list);

		AdminVO vo = new AdminVO();
		vo.setADID(adid);
		vo.setADPW(adpw);


		int result = Adao.Login(vo);

		if (result == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("AdminVO", vo);
			
			return "redirect:/admin/adminIndex";
		} else {
			model.addAttribute("msg", 1);
			return "admin/adminLogin";
		}
	}

	@RequestMapping(value = "/admin/adminLogout", method = RequestMethod.GET)
	public String Adminlogout(HttpServletRequest req) {
		req.getSession().invalidate();

		return "redirect:/";
	}

}
