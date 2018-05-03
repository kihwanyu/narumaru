package com.kh.narumaru.admin.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.admin.model.service.AdminService;
import com.kh.narumaru.admin.model.vo.Admin;
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
	public String showmAdminMoneyView(){
		
		return "admin/adMoneyView";
	}
	
	@RequestMapping("adRevenueView.ad")
	public ModelAndView showmAdminRevenueView(ModelAndView mv){
		ArrayList RevenueMember = as.RevenueMember();
		System.out.println("RevenueMember : " + RevenueMember);
		
		mv.addObject("RevenueMember", RevenueMember);
		
		ArrayList totalAge = as.totalAge();
		System.out.println("totalAge" + totalAge);
		mv.addObject("totalAge", totalAge);
		
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

	
	// 관리자 1:1 문의 게시판
	@RequestMapping(value="adAnswer.ad")
	public String showAdminAnswerView(){
		
		return "admin/adAnswer";
	}
	
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
		public String insertNotice(Notice n, Model model,
				HttpServletRequest request,@RequestParam(name="subType") int subType){
			
			if(n.getNoType() == 800){
				n.setNoType(subType);
			}

			System.out.println("AdminController notice subType : "  + n +", " + subType);

			
			as.insertNotice(n, subType);
			
			
			return "main/main";
			
			
		}
	
}