package com.kh.narumaru.maru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loginUser")
public class MaruController {
	
	@RequestMapping(value="maruInsertView.ma")
	public String showMaruInsertView(){
		   
		return "maru/maruInsertPage";
	}
	
	@RequestMapping("maruChannelView.ma")
	public String showMaruChannelView(){
		   
		return "maru/maruChannelPage";
	}
	
	
	@RequestMapping("insertDetail.ma")
	public String showMaruInsertDetail(){
		
		return "maru/maruBoard";
	}
	@RequestMapping("showMaruAlbum.ma")
	public String showMaruBoardAlbum(){
		
		return "maru/maruAlbum";
	}
	@RequestMapping("showMaruCalendar.ma")
	public String showMaruBoardCalendar(){
		
		return "maru/maruCalendar";
	}
	@RequestMapping("showMaruMember.ma")
	public String showMaruBoardMember(){
		
		return "maru/maruMember";
	}
	@RequestMapping("showMaruMemberInvate.ma")
	public String showMaruBoardMemberInvate(){
		
		return "maru/maruMemberInvate";
	}
	@RequestMapping("showMaruSetting.ma")
	public String showMaruSetting(){
		
		return "maru/maruSetting";
	}
	
}
