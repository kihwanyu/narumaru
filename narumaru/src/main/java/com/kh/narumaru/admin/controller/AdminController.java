package com.kh.narumaru.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.narumaru.admin.model.service.AdminService;

@Controller
@SessionAttributes("loginUser")
public class AdminController {
	/*@Autowired
	private AdminService as;*/
	
	//최근 신고 게시판
	@RequestMapping(value="adDeclare.ad")
	public String showAdminDeclareView(){
		
		return "admin/adDeclare";
	}
	
	//신고내용 자세히 보기
	@RequestMapping(value="adDeclareDetail.ad")
	public String showAdminDeclareDetailView(){
		
		return "admin/adDeclareDetail";
	}
	
	
}
