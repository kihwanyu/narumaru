package com.kh.narumaru.notice.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.notice.exception.NoticeDeleteException;
import com.kh.narumaru.notice.exception.NoticeUpdateException;
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
		
	//공지사항 Detail
	@RequestMapping(value = "noticeDetail.no")
	public ModelAndView showNoticeDetailView(ModelAndView mv,SessionStatus status, int bno){
		
		System.out.println("noticeController showNoticeDetailView bno : " + bno);
	
		Notice n = ns.showNoticeDetailView(bno);
		System.out.println("noticeController showNoticeDetailView n : " + n);
		
		mv.addObject("n" ,n);
		status.setComplete();
		
		mv.setViewName("notice/noticeDetail");
		
		return mv;
	}
	
	//공지사항 수정 페이지로 이동
	@RequestMapping(value = "noticeUpdate.no")
	public ModelAndView updateNotice(ModelAndView mv, SessionStatus status, int bno){
		
		System.out.println("NoticeController updateNotice bno : " + bno);
		
		Notice n = ns.showNoticeDetailView(bno);

		System.out.println("NoticeController updateNotice n : " + n);
		
		mv.addObject("n", n);
		
		status.setComplete();
		
		mv.setViewName("notice/noticeUpdate");
		
		return mv;
	}
	
	//Notice, FAQ 수정 저장
	@RequestMapping(value="noticeUpdateCommit.no"/*, method=RequestMethod.POST*/)
	public String updateNoticeCommit(Notice n){
		
		System.out.println("NoticeController updateNoticeCommit n : " + n);
		
		try {
			ns.updateNoticeCommit(n);
			
			
		} catch (NoticeUpdateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/noticeDetail.no?bno="+n.getnid();
	}
	
	//Notice, FAQ 삭제
	@RequestMapping(value="noticeDelete.no")
	public String deleteNotice(int bno){
		System.out.println("NoticeController deleteNotice bnn : "+ bno);
		
		try {
			ns.deleteNotice(bno);
		} catch (NoticeDeleteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "notice/NoticeList";
		
	}
	
	
	//FAQ 조회
		@RequestMapping(value = "FAQ.no")
		public ModelAndView showFAQView(Notice n, 
				ModelAndView mv, SessionStatus status){
			System.out.println("noticeController showFAQView n : " + n);
			
			ArrayList<Notice> nlist = ns.faqSelectList(n);
			System.out.println("noticeController showFAQView nlist = "  +nlist);
			
			
			mv.addObject("nlist", nlist);
			status.setComplete();
			
			mv.setViewName("notice/FAQ");
			
			return mv;
		}
		
		
		//Faq Detail 
		@RequestMapping(value = "faqDetail.no")
		public ModelAndView showFaqDetailView(ModelAndView mv,SessionStatus status, int bno){
			
			System.out.println("noticeController showFaqDetailView bno : " + bno);
		
			Notice n = ns.showFaqDetailView(bno);
			System.out.println("noticeController showFaqDetailView n : " + n);
			
			mv.addObject("n" ,n);
			status.setComplete();
			
			mv.setViewName("notice/faqDetail");
			
			return mv;
		}
		
		//Faq 수정 페이지로 이동
		@RequestMapping(value = "faqUpdate.no")
		public ModelAndView updateFaq(ModelAndView mv, SessionStatus status, int bno){
			
			System.out.println("NoticeController updateFaq bno : " + bno);
			
			Notice n = ns.showFaqDetailView(bno);

			System.out.println("NoticeController updateFaq n : " + n);
			
			mv.addObject("n", n);
			
			status.setComplete();
			
			mv.setViewName("notice/faqUpdate");
			
			return mv;
		}
		
		
		//1:1 문의하기
		@RequestMapping(value = "question.no")
		public String showquestionView(){
			
			return "notice/question";
		}
	
}
