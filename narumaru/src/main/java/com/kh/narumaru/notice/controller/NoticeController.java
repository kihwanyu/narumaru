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

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.notice.exception.NoticeDeleteException;
import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.exception.questionInsertException;
import com.kh.narumaru.notice.exception.searchFaqException;
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
			ModelAndView mv, SessionStatus status, 
			HttpServletRequest request){

			System.out.println("noticeController noticeSelectList");
			int currentPage;
			int limit;
			int maxPage;
			int startPage;
			int endPage;
			
			currentPage =1;
			limit = 10;
			//
			if(request.getParameter("currentPage") != null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
			}
			
	
			int listCount;
			System.out.println("noticeController noticeSelectList getLstCount");
			
			listCount = ns.getListCount(currentPage);
			
			maxPage = (int)((double)listCount / limit + 0.9);
			startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
			endPage = startPage + limit -1;
			if(maxPage<endPage){
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, currentPage);
			
			ArrayList<Notice> nlist = ns.noticeSelectList(n);
			
			
			
			mv.addObject("nlist", nlist);
			mv.addObject("pi", pi);
			
			mv.setViewName("mypage/myPage_pointPayment");	
			System.out.println("noticeController noticeSelectList noList : " + nlist);
			
			mv.addObject("noList",nlist);
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
			
			
			mv.setViewName("notice/FAQ");
			
			return mv;
		}
		
		//FAQ 검색하기
		@RequestMapping(value = "searchFaqList.no")
		public void showSearchFAQListView(String keyWord, HttpServletResponse response){
			System.out.println("noticeController showSearchFAQListView keyword : " + keyWord);
			
			
			try {

				ArrayList<Notice> nlist = ns.SearchFAQList(keyWord);
				System.out.println("noticeController showSearchFAQListView nlist : " + nlist);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				new Gson().toJson(nlist, response.getWriter());
				
			} catch (JsonIOException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (searchFaqException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		//Faq Detail 
		@RequestMapping(value = "faqDetail.no")
		public ModelAndView showFaqDetailView(ModelAndView mv,SessionStatus status, int bno){
			
			System.out.println("noticeController showFaqDetailView bno : " + bno);
		
			Notice n = ns.showFaqDetailView(bno);
			System.out.println("noticeController showFaqDetailView n : " + n);
			
			mv.addObject("n" ,n);
			
			
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
			
			
			mv.setViewName("notice/faqUpdate");
			
			return mv;
		}
		
		
		//1:1 문의하기
		@RequestMapping(value ="question.no")
		public String showquestionView(@RequestParam(name="fileName", required=false) MultipartFile question
				, HttpServletRequest request, HttpSession session, HttpServletResponse response, Notice n) throws IOException{
			System.out.println("noticecontroller question");
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			
			
			System.out.println("noticecontroller question");
			
			
			
			return "notice/question";
		}
		
		//1:1 문의하기 삽입
		@RequestMapping(value ="questionForm.no", method=RequestMethod.POST)
		public String showquestionFormView(HttpServletRequest request
				, @RequestParam(name="orFileName") MultipartFile question 
				, MultipartRequest multipartRequest
				, HttpSession session, HttpServletResponse response){
			
	
			System.out.println("noticecontroller questionForm question : "  + question);
			//Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			Notice n = new Notice();
			
			
			System.out.println("request : " + request.getParameter("noContent"));
			
			
			System.out.println("NoticeController questionForm loginUser.getMid() : " + loginUser.getMid());
			System.out.println("NoticeController questionForm question.getOriginalFilename : " + question.getOriginalFilename());
			
			
			String message ="";
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String filePath = root + "\\question";
			String orfileName = "";
			String chfileName= "";
			System.out.println("NoticeController questionForm filePath : " + filePath);
			
			try {
				System.out.println("NoticeController questionForm Try 나오니 ?");
				
				File deleteFile = new File(filePath + "\\" + n.getOrFileName());
				deleteFile.delete();
				
				orfileName = question.getOriginalFilename();
				
				int dot = orfileName.lastIndexOf(".");
				
				String ext = orfileName.substring(dot);
				
				chfileName = String.valueOf(loginUser.getMid()) + loginUser.getNickName()+ ext;
				
				
				
				n.setNoType(900);
				n.setNoTitle(request.getParameter("noTitle"));
				n.setNoContent(request.getParameter("noContent"));
				n.setWriterId(loginUser.getMid());
				n.setOrFileName(orfileName);
				n.setChFileName(chfileName);
				
				System.out.println("noticeController questionForm n : " + n);
				
				question.transferTo(new File(filePath + "\\" + chfileName ));
			
			
			
			
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			try{
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
			} catch (questionInsertException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}*/	
			return "notice/noticeSuccess";
		}
		
		//성공에이지
		@RequestMapping(value ="success.no")
		public String showSuccessView(){
			
			return "notice/noticeSuccess";
		}
	
}
