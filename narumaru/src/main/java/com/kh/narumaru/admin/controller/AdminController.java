package com.kh.narumaru.admin.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.admin.model.service.AdminService;
import com.kh.narumaru.admin.model.service.AdminServiceImpl;
import com.kh.narumaru.member.model.vo.Member;

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
		
		mv.setViewName("admin/adMain");
		return mv;
	}
	
	
	@RequestMapping(value="adMemberView.ad")
	public String showAdminMemberView(){
		   
		return "admin/adMemberView";
	}
	
	@RequestMapping("adNaruView.ad")
	public String showAdminNaruView(){
		   
		return "admin/adNaruView";
	}
	
	@RequestMapping("adMaruView.ad")
	public String showmAdminMaruView(){
		
		return "admin/adMaruView";
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
	public String showmAdminRevenueView(){
		
		return "admin/adRevenueView";
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
	
	//관리자 공지글쓰기
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
	
}