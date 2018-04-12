package com.kh.narumaru.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loginUser")
public class AdminController {

	@RequestMapping(value="adMain.ad")
	public String showAdminMainView(){
		   
		return "admin/adMain";
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
	
}