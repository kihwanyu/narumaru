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