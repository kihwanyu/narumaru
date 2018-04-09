package com.kh.narumaru.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.narumaru.admin.model.service.AdminService;

@Controller
@SessionAttributes("loginUser")
public class NoticeController {

	//공지사항
	@RequestMapping(value="Notice.no")
	public String showNoticeView(){
		
		return "notice/Notice";
	}
	
	//공지사항 Detail
	@RequestMapping(value = "noticeDetail.no")
	public String showNoticeDetailView(){
		
		return "notice/noticeDetail";
	}
	
	//FAQ
	@RequestMapping(value = "FAQ.no")
	public String showFAQView(){
		
		return "notice/FAQ";
	}
	//씨발 ................. 좆 됐따 
}
