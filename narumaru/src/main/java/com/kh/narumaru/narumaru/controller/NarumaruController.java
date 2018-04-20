package com.kh.narumaru.narumaru.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.service.MaruService;
import com.kh.narumaru.maru.model.service.MaruServiceImpl;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.service.ChannelService;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.service.NarumaruService;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Controller
@SessionAttributes("nm")
public class NarumaruController {
	
	@Autowired
	private NarumaruService nms;
	@Autowired
	private ChannelService cs;
	@Autowired
	private MaruService ms;
	
	@RequestMapping("goHome.nm")
	public String goHome(){
		return "main/main";
	}
	
	@RequestMapping(value = "boardListAll.bo")
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
		if(nm.getNmCategory() ==2){
			mv.setViewName("naru/naruBoard"); 
		}else{
			mv.setViewName("maru/maruBoard"); 
		}
		
		
		return mv;
	}
	
	@RequestMapping(value="selectChannelList.nm")
	public void checkNarumaruOwner(HttpServletRequest request, HttpServletResponse response) throws selectChanelException{
		try {
			ArrayList<Channel> clist = cs.selectAllChannel();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(clist, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	
	@RequestMapping("insertNarumaruBoard.nm")
	public String insertNaruBoard(HttpServletRequest request, int nmno) throws NarumaruException{
		Member loginUser = (Member)request.getSession().getAttribute("loginUser"); 
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardHidden = request.getParameter("boardHidden");
		
		int channel = 0;  
		if(request.getParameter("channel") != null) channel = Integer.parseInt(request.getParameter("channel"));
		int category = 0; 
		if(request.getParameter("category") != null) category=Integer.parseInt(request.getParameter("category"));
		int needPoint = 0;
		if(request.getParameter("needPoint") != null) needPoint=Integer.parseInt(request.getParameter("needPoint"));
		
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
		
		Board b = new Board();
		
		b.setbTitle(boardTitle);
		b.setbContent(boardContent);
		
		if(boardHidden==null){
			b.setbHidden("");
		}else{
			b.setbHidden(boardHidden);
		}
		b.setCno(channel);
		b.setbType(1);
		b.setMno(loginUser.getMid());
		b.setCano(category);
		b.setNmno(nmno);
		b.setIsOpen(openLevel);
		
		nms.insertNarumaruBoard(b);
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
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
			System.out.println("mm:"+mm);
			ms.insertMaruMember(mm);
			mv.addObject("nm", nm);
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
