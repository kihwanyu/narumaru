package com.kh.narumaru.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.notice.model.service.noticeService;
import com.kh.narumaru.notice.model.vo.Notice;


@Controller
@SessionAttributes("loginUser")
public class NoticeController {
	@Autowired
	private noticeService ns;
	
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
	
	//1:1 문의하기
	@RequestMapping(value = "question.no")
	public String showquestionView(){
		
		return "notice/question";
	}
	
	// 공지사항 조회하기 
	@RequestMapping(value = "noticeSelectList.no")
	public ModelAndView noticeSelectList(Notice n, 
			ModelAndView mv, SessionStatus status){

		System.out.println("noticeController noticeSelectList");
		
		ArrayList<Notice> noList = ns.noticeSelectList(n);
		System.out.println("noticeController noticeSelectList noList : " + noList);
		
		mv.addObject("noList",noList);
		status.setComplete();
		
		mv.setViewName("notice/NoticeList");
		
		
		return mv;
		
		
	}
	
	
	// FAQ 조회하기 
	//@RequestMapping(value = "FAQSelectList.no")
	
}
