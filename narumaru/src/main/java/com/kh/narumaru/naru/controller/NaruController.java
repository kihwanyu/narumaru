package com.kh.narumaru.naru.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.narumaru.member.model.vo.Member;

@Controller
public class NaruController {
	
	@RequestMapping("naruMain.na")
	public String showNaruMainView(){
		System.out.println("나후로도?");
		return "naru/naruMainPage";
	}
	
	@RequestMapping("toNaruBoardWrite.na")
	public ModelAndView toNaruBoardWrite(ModelAndView mv, int nmno){
		
		mv.addObject("nmno", nmno);
		
		mv.setViewName("naru/naruInsertBoard"); 
		
		return mv;
	}
	
	
	
}
