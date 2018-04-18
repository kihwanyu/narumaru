package com.kh.narumaru.narumaru.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.service.MaruService;
import com.kh.narumaru.maru.model.service.MaruServiceImpl;
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
	/*@Autowired
	MaruService ms;*/
	
	@RequestMapping("goHome.nm")
	public String goHome(){
		return "main/main";
	}
	
	@RequestMapping(value = "boardListAll.bo", method = RequestMethod.POST)
	public ModelAndView showBoardList(int nmno, ModelAndView mv, HttpServletRequest request){
		System.out.println("조회하는 나루마루번호 " + nmno);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		ArrayList<Board> list = nms.selectBoardList(nmno); 
		Narumaru nm = nms.selectNarumaruOne(nmno);
		boolean isOwner = nms.checkNarumaruOwner(nmno, loginUser);
		
		mv.addObject("nm", nm);
		mv.addObject("list", list);
		mv.addObject("isOwner", isOwner);
		mv.setViewName("naru/naruBoard"); 
		
		return mv;
	}
	
	@RequestMapping(value = "checkNarumaruOwner.nm")
	public void checkNarumaruOwner(int nmno, HttpServletRequest request, HttpServletResponse response){
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		try {
			boolean isOwner = nms.checkNarumaruOwner(nmno, loginUser);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(isOwner, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("insertNarumaru.nm")
	public ModelAndView insertNarumaru(Narumaru nm, ModelAndView mv, HttpServletRequest request){
		System.out.println(nm);
		try {
			int nmno = nms.insertNarumaru(nm).getNmno();
			System.out.println(nmno);
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			MaruMember mm = new MaruMember();
			MaruService ms = new MaruServiceImpl();
			mm.setMno(loginUser.getMid());
			mm.setNmno(nmno);
			mm.setConLevel(0);
			System.out.println("mm:"+mm);
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
