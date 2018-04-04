package com.kh.narumaru.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String showMainView(){
		System.out.println("메인으로!!!!!");
		
		return "main/main";
	}
	
	
}
