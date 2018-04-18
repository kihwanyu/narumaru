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
	
	@RequestMapping("insertNaruBoard.na")
	public String insertNaruBoard(HttpServletRequest request, int nmno){
		Member loginUser = (Member)request.getSession().getAttribute("loginUser"); 
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardHidden = request.getParameter("boardHidden");
		String channel = request.getParameter("channel");
		String category = request.getParameter("category");
		int needPoint = Integer.parseInt(request.getParameter("needPoint"));
		String openLevel = request.getParameter("openLevel");
		String replyCondition = request.getParameter("replyCondition");
		
		System.out.println(boardTitle);
		System.out.println(boardContent);
		System.out.println(boardHidden);
		System.out.println("채널:" + channel);
		System.out.println(category);
		System.out.println(needPoint);
		System.out.println(openLevel);
		System.out.println(replyCondition);
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
}
