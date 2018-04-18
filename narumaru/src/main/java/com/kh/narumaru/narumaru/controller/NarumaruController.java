package com.kh.narumaru.narumaru.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.service.MaruService;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.service.NarumaruService;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Controller
@SessionAttributes("loginUser")
public class NarumaruController {
	@Autowired
	NarumaruService nms;
	
	MaruService ms;
	
	@RequestMapping("goHome.nm")
	public String goHome(){
		return "main/main";
	}
	@RequestMapping(value = "boardListAll.bo", method = RequestMethod.POST)
	public ModelAndView showBoardList(int nmno, ModelAndView mv){
		System.out.println("조회하는 나루마루번호 " + nmno);
		
		ArrayList<Board> list = nms.selectBoardList(nmno); 
		
		mv.addObject("list", list);
		mv.setViewName("naru/naruBoard"); 
		
		return mv;
	}
	
	@RequestMapping("insertNarumaru.nm")
	public ModelAndView insertNarumaru(Narumaru nm, ModelAndView mv, HttpServletRequest request){
		System.out.println(nm);
		try {
			int nmno = nms.insertNarumaru(nm).getNmno();
			System.out.println(nmno);
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			MaruMember mm = new MaruMember();
			mm.setMno(loginUser.getMid());
			mm.setNmno(nmno);
			mm.setConLevel(0);
			ms.insertMaruMember(mm);
			mv.addObject("Maru", nm);
			mv.setViewName("maru/maruBoard");
		} catch (NarumaruException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");			
		} catch (MaruException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");	
		}
		
		return mv;
	}
	
	
}
