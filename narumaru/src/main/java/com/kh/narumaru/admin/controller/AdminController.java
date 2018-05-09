package com.kh.narumaru.admin.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import javax.servlet.http.HttpServletResponse;


import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.admin.model.service.AdminService;
import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.vo.Alarm;
import com.kh.narumaru.notice.model.vo.Notice;


import com.kh.narumaru.admin.model.service.AdminService;
import com.kh.narumaru.admin.model.service.AdminServiceImpl;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Narumaru;


@Controller
@SessionAttributes("loginUser")
public class AdminController {

	@Autowired
	private AdminService as;
	@Autowired

	private JavaMailSender mailSender;
	private AlarmService als;

	
	@RequestMapping(value="adMain.ad")
	public ModelAndView showAdminMainView(ModelAndView mv){
		HashMap EnrollDateList = as.selectEnrollDateList();
		mv.addObject("Date", EnrollDateList.get("date"));
		mv.addObject("Count", EnrollDateList.get("count"));
		System.out.println("나오니?" + EnrollDateList);
		
		Iterator iter = EnrollDateList.keySet().iterator();
		
		while(iter.hasNext()){
			System.out.println("에베베" + EnrollDateList.get(iter.next()));
		}
		
		int totalMember = as.selectTotalMember();
		System.out.println("회원수 : " + totalMember);
		mv.addObject("totalMember", totalMember);// 회원수
		
		int totalMaru = as.selectTotalMaru();
		System.out.println("마루수 : " + totalMaru);
		mv.addObject("totalMaru", totalMaru);
		
		int sysDateJoinMember = as.selectDateJoinMember();
		System.out.println("금일 회원가입수 : " + sysDateJoinMember);
		mv.addObject("sysDateJoinMember", sysDateJoinMember);//금일 회원가입수
		
		int payDaySysDate = as.selectPayDaySysDate();
		System.out.println("금일 결제 금액" + payDaySysDate);
		mv.addObject("payDaySysDate", payDaySysDate);
		
		ArrayList channel = as.selectChannel(); 
		System.out.println("채널 목록" + channel);
		mv.addObject("channel", channel);
		
		ArrayList chCount = as.selectChCount();
		System.out.println("채널 수 : " + chCount);
		mv.addObject("chCount", chCount);
		
		mv.setViewName("admin/adMain");
		
		return mv;
	}
	
	@RequestMapping(value = "totalSelect.ad")
	public ModelAndView showTotalView(ArrayList<Admin> a,ModelAndView mv){
		System.out.println("Admincontroller showTotalView ");
		
		ArrayList<Admin> alist = as.showTotalView(a);
		System.out.println(alist);
		
		
		mv.addObject("alist",alist);
		mv.setViewName("admin/adMain");
		
		
		return mv;
	}
	
	
	@RequestMapping(value="adMemberView.ad")
	public ModelAndView showAdminMemberView(Member m, ModelAndView mv){
		ArrayList<Member> memberView = as.memberView();
		System.out.println(memberView);
		
		
		mv.addObject("memberView", memberView);
		mv.setViewName("admin/adMemberView");
		
		return mv;
	}
	
	@RequestMapping("statusCh.ad")
	public void statusCh(Member m, HttpServletResponse response){
		try {
			as.statusCh(m);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson("젠장", response.getWriter());
		} catch (Exception e) {
			
		}
		System.out.println("컨트롤러 멤버" + m);
	}
	
	@RequestMapping("adNaruView.ad")
	public ModelAndView showAdminNaruView(Narumaru naru, ModelAndView mv){
		ArrayList<Narumaru> na = as.naruView();
		System.out.println(na);
		
		mv.addObject("na", na);
		mv.setViewName("admin/adNaruView");
		
		
		return mv;
	}
	
	@RequestMapping("adMaruView.ad")
	public ModelAndView showmAdminMaruView(Narumaru maru, ModelAndView mv){
		ArrayList<Narumaru> ma = as.maruView();
		System.out.println("컨트롤러 ma : " + ma);
		
		mv.addObject("ma", ma);
		mv.setViewName("admin/adMaruView");
		
		return mv;
	}
	
	@RequestMapping("adLoginManagView.ad")
	public String showmAdminLoginManagementView(){
		
		return "admin/adLoginManagView";
	}
	
	@RequestMapping("adMoneyView.ad")
	public ModelAndView showmAdminMoneyView(ModelAndView mv){
		ArrayList moneyView = as.moneyView();
		
		
		
		System.out.println(moneyView);
		
		mv.addObject("moneyView", moneyView);
		mv.setViewName("admin/adMoneyView");
		
		return mv;
	}
	
	@RequestMapping("moneyStatusCh.ad")
	public void moneyStatusCh(int WNO, HttpServletResponse response){
		try {
			as.moneyStatusCh(WNO);
			
			ArrayList<Alarm> alarmList = new ArrayList<>();
			// 보낼 유저의 번호를 구한다.
			ArrayList<Integer> sendUser = as.sendUser(WNO);
			
			/*Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.*/
			for(int i = 0; i < sendUser.size(); i++){
				Alarm a = new Alarm();
				a.setReceive_mno(sendUser.get(i));
				a.setAtno(102);
				alarmList.add(a);
			}
			
			System.out.println("alarmList : " + alarmList);
			
			try {
				als.alarmRequest(alarmList);
			} catch (alarmRequestException e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("moneyStop.ad")
	public void moneyStop(int WNO, HttpServletResponse response){
		System.out.println(WNO);
		
		ArrayList<Alarm> alarmList = new ArrayList<>();
		// 보낼 유저의 번호를 구한다.
		ArrayList<Integer> sendUser = as.sendUser(WNO);
		
		/*Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.*/
		for(int i = 0; i < sendUser.size(); i++){
			Alarm a = new Alarm();
			a.setReceive_mno(sendUser.get(i));
			a.setAtno(103);
			alarmList.add(a);
		}
		
		try {
			als.alarmRequest(alarmList);
		} catch (alarmRequestException e) {
			e.printStackTrace();
		}
		
		try {
			as.moneyStop(WNO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("adRevenueView.ad")
	public ModelAndView showmAdminRevenueView(ModelAndView mv){
		ArrayList RevenueMember = as.RevenueMember();
		System.out.println("RevenueMember : " + RevenueMember);
		
		mv.addObject("RevenueMember", RevenueMember);
		
		ArrayList totalAge = as.totalAge();
		System.out.println("totalAge" + totalAge);
		mv.addObject("totalAge", totalAge);
		
		ArrayList Chart = as.Chart();
		System.out.println("Chart" + Chart);
		mv.addObject("Chart", Chart);
		
		mv.setViewName("admin/adRevenueView");
		
		return mv;
	}
	
	
	//신고하기
	@RequestMapping("adDeclare.ad")
	public String showAdminDeclareView(){
		
		return "admin/adDeclare";
	}
	
	//신고내용 자세히 보기
	@RequestMapping("adDeclareDetail.ad")
	public String showAdminDeclareDetailView(){
		
		return "admin/adDeclareDetail";
	}

	//
	
	
	//관리자 공지글쓰기 페이지로 이동
	@RequestMapping(value="adAnnouncement.ad")
	public String showAdminAnnouncementView(){
		
		return "admin/adAnnouncement";
	}
	//관리자 메인 그래프
	@RequestMapping("adCountEnrollDate.ad")
	public void CountEnrollDate(){
		HashMap EnrollDateList = as.selectEnrollDateList();
		System.out.println(EnrollDateList);
	}
	
	
	// 기능
		// 공지 or FAQ 글쓰기
		@RequestMapping(value="adAnnounce.ad")
		public String insertNotice(Notice n, Model model
				, HttpServletRequest request,@RequestParam(name="subType") int subType
				, HttpSession session ){
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			if(n.getNoType() == 800){
				n.setNoType(subType);
			}
			n.setWriterId(loginUser.getMid());
			
			System.out.println("AdminController notice  : "  + n );

			
			int bno = as.insertNotice(n, subType);
			
			ArrayList<Alarm> alarmList = new ArrayList<>();
			// 보낼 유저의 번호를 구한다.
			ArrayList<Integer> sendUser = as.getMemberMnoAll();
			
			/*Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.*/
			for(int i = 0; i < sendUser.size(); i++){
				Alarm a = new Alarm();
				a.setReceive_mno(sendUser.get(i));
				a.setAtno(100);
				a.setSend_bno(bno);
				alarmList.add(a);
			}
			
			try {
				als.alarmRequest(alarmList);
			} catch (alarmRequestException e) {
				e.printStackTrace();
			}
			return "admin/adSuccess";
			
			
		}
		
		// 관리자 1:1 문의 게시판 조회
		@RequestMapping(value="adminAnswer.ad")
		public ModelAndView showAdminAnswerView(
				ModelAndView mv, SessionStatus status){

				System.out.println("adminController showAdminAnswerView");
				
				ArrayList<HashMap> nlist = as.adminAnswer();
				System.out.println("adminController showAdminAnswerView noList : " + nlist);
			
				
				mv.addObject("nlist",nlist);
				
				
				mv.setViewName("admin/adAnswer");
				
				
				return mv;
		}
		
		// 1:1 문듸 답변하기 상세페이지
		@RequestMapping(value = "adminanswerDetail.ad")
		public ModelAndView showadminAnswerDetailView(ModelAndView mv,SessionStatus status, int bno){
			
			System.out.println("adminController showadminAnswerDetailView bno : " + bno);
		
			HashMap hlist = (HashMap) as.showAnswerDetailView(bno);
			
			System.out.println("nadminController showadminAnswerDetailView hlist : " + hlist);
			
			mv.addObject("hlist" ,hlist);
			
			
			mv.setViewName("admin/adminanswerDetail");
			
			return mv;
		}
		
		// 1:1 문의 답변하기 Form
		@RequestMapping(value = "adAnswerForm.ad")
		public ModelAndView adAnswerForm(ModelAndView mv, int bno, 
				SessionStatus status){
			/*
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");*/
			
			System.out.println("adminController showadminAnswerDetailView  bno : "  + bno);
		
			HashMap hlist = (HashMap) as.showAnswerDetailView(bno);
			
			System.out.println("nadminController showadminAnswerDetailView hlist : " + hlist);
			
			
			mv.addObject("hlist" ,hlist);
			
			
			mv.setViewName("admin/adminAnswerForm");
			
			return mv;
		}
		
		//이메일로 전송하기 smtp
		@RequestMapping(value ="adminEmailSend.ad")
		public ModelAndView adminEmailSend(ModelAndView mv,HttpServletRequest request, HttpServletResponse response){
			
			String answerTitle = request.getParameter("answerTitle");
			String answerContent = request.getParameter("answerContent");
			String questionEmail = request.getParameter("email");
			String AnswerYN = request.getParameter("stauts");
			int AnswerBno = Integer.parseInt(request.getParameter("bno"));
			
			System.out.println("adminSendEmail AnswerYN AnswerBno : " + AnswerBno + " / " + AnswerYN);
			as.adminSendEmail(AnswerYN,AnswerBno);
			
			System.out.println("adminController adminEmailSend answerTitle / answerContent : " +answerTitle +" / " + answerContent );
			System.out.println("questionEmail : " + questionEmail);
			
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("wlgus12312@gmail.com");
			message.setTo(questionEmail);
			message.setSubject(answerTitle);
			message.setText(answerContent);
			
			mailSender.send(message);
		
			mv.setViewName("admin/adSuccess");
			
			return mv;
		}
		
}