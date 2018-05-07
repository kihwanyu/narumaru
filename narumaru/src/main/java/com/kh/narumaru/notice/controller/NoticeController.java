package com.kh.narumaru.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.member.model.vo.Member;
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
		
		return "redirect:/noticeDetail.no?bno="+n.getNid();
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
		@RequestMapping(value ="question.no")
		public String showquestionView(@RequestParam(name="fileName", required=false) MultipartFile question
				, HttpServletRequest request, HttpSession session, HttpServletResponse response, Notice n) throws IOException{
			System.out.println("noticecontroller question");
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			
			System.out.println("NoticeController questionView loginUser.getMid() n : " + loginUser.getMid() + " / " + n);
			System.out.println("question : " + question.getOriginalFilename());
			
			Member m = new Member();
			String message ="";
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String filePath = root + "\\question";
			String fileName = "";
			System.out.println(filePath);
			
		
			
			
			
			
			try {
				
				File deleteFile = new File(filePath + "\\" + n.getFileName());
				deleteFile.delete();
				
				fileName = question.getOriginalFilename();
				
				int dot = fileName.lastIndexOf(".");
				
				String ext = fileName.substring(dot);
				
				fileName = String.valueOf(loginUser.getMid()) + loginUser.getNickName()+ ext;
				
				
				n.setNid(n.getNid());
				n.setWriterId(loginUser.getMid());
				n.setFileName(fileName);
				
				question.transferTo(new File(filePath + "\\" + fileName ));
			
			
			
			
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			
			
		
		
				
				ns.questionInsert(n);
				session.removeAttribute("loginUser");
				session.setAttribute("loginUser", loginUser);
				
				response.getWriter().print("true");
			} /*catch (IOException e) {
				try {
					response.getWriter().print("false");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			}*/
			
			
			return "notice/question";
		}
	
}
