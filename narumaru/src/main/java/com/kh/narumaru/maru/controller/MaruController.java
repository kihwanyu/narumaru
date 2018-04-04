package com.kh.narumaru.maru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loginUser")
public class MaruController {
	
	@RequestMapping("maruInsertView.ma")
	public String showMaruInsertView(){
		   
		return "maru/maruInsertPage";
	}
	
	@RequestMapping("maruChannelView.ma")
	public String showMaruChannelView(){
		   
		return "maru/maruChannelPage";
	}
	
	@RequestMapping("insertDetail.ma")
	public String showmaruInsertDetail(){
	      
		return "maru/maruInsertDetail";
	}
}
