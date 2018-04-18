package com.kh.narumaru.admin.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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

@Controller
@SessionAttributes("loginUser")
public class AdminController {
	
	@Autowired
	private AdminService as;

	@RequestMapping(value="adMain.ad")
	public String showAdminMainView(){
		   
		return "admin/adMain";
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
	
	//관리자 공지글쓰기 페이지로 이동
	@RequestMapping(value="adAnnouncement.ad")
	public String showAdminAnnouncementView(){
		
		return "admin/adAnnouncement";
	}
	
	
	// 기능
	// 공지 or FAQ 글쓰기
	@RequestMapping(value="adAnnounce.ad")
	public String insertNotice(Notice n, Model model,
			@RequestParam(name="photo", required =false )MultipartFile photo,
			HttpServletRequest request){
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\noticeUploadFiles";
		
		try {
			photo.transferTo(new File(filePath + "\\" + photo.getOriginalFilename()));
		
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		as.insertNotice(n);
		
		
		return "main/main";
		
		
	}
	
	
}