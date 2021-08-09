package kr.co.sinsa.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sinsa.admin.service.NoticeService;
import kr.co.sinsa.admin.vo.NoticeVO;

@Controller
public class NoticeContorller {
	
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("/admin/noticeList")
	public String getNoticeList(Model model) {
		List<NoticeVO> list = noticeService.notice_list();
		model.addAttribute("noticeList", list);
		return "admin/noticeList";		
	}
	
	@RequestMapping("/admin/noticeInfo")
	public String getNotice(Model model, @RequestParam int notice_num) {
		model.addAttribute("noticeInfo", noticeService.notice_info(notice_num));
		return "admin/noticeInfo";
	}
			
	@RequestMapping(value = "/admin/noticeInputForm", method = RequestMethod.GET)
	public String noticeInputForm(NoticeVO vo) {
		return "admin/noticeInputForm";
	}
			
	@RequestMapping(value = "/admin/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(NoticeVO vo) {
		noticeService.notice_insert(vo);
		return "redirect:/admin/noticeList";
	}
			
	@RequestMapping("/admin/noticeEdit")
	public String noticeEdit(Model model, @RequestParam int notice_num) {
		model.addAttribute("noticeInfo", noticeService.notice_info(notice_num));
		return "admin/noticeEdit";
	}
			
	@RequestMapping("/admin/noticeUpdate")
	public String noticeUpdate(Model model, NoticeVO vo) {
//		model.addAttribute("notice_num", vo.getNotice_num());
		noticeService.notice_update(vo);
		return "redirect:/admin/noticeList";
	}
			
	@RequestMapping("/admin/noticeDelete")
	public String noticeDelete(@RequestParam int notice_num) {
		noticeService.notice_delete(notice_num);
		return "redirect:/admin/noticeList";
	}
	
}
