package com.kh.narumaru.naru.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.vo.Alarm;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.service.HiddenService;
import com.kh.narumaru.naru.model.service.NaruService;
import com.kh.narumaru.naru.model.vo.Category;
import com.kh.narumaru.narumaru.model.service.NarumaruService;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.service.UsePointService;

@Controller
public class NaruController {
	@Autowired
	private NaruService ns;
	@Autowired
	private NarumaruService nms;
	@Autowired
	private UsePointService ups;
	@Autowired
	private PaymentService ps;
	@Autowired
	private AlarmService as;
	
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
	
	@RequestMapping("selectCategoryList.na")
	public void selectCategoryList(int nmno, HttpServletResponse response){
		ArrayList<Category> list = ns.selectCategoryList(nmno);
		
		System.out.println("카테고리 리스트 : " + list);
		
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateCategory.na")
	public String updatecategory(ModelAndView mv, int nmno, HttpServletRequest request) throws NaruException{
		int i=0;
		ArrayList<String> categorys = new ArrayList<String>(); 
		while(true){
			String temp = "addedCategory" + i++;
		
			String cate = request.getParameter(temp);
			
			if(cate == null){
				break;
			}else if(cate.equals(":none:")){
				continue;
			}else{
				System.out.println(cate);
				categorys.add(cate);
			}
		}
		
		//중복값 제거용
		HashSet<String> hs = new HashSet();
		hs.addAll(categorys);
		categorys.clear();
		categorys.addAll(hs);
		
		//이하 카테고리 재설정
		
		for(String s : categorys){
			ns.insertCategory(s, nmno);
		}
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	@RequestMapping("updateTheme.na")
	public String updateTheme(int nmno, HttpServletRequest request){
		String themeValue = "#" + request.getParameter("themeValue");
		String boardValue = "#" + request.getParameter("boardValue");
		String fontValue = request.getParameter("fontValue");
		
		ns.updateTheme(nmno, themeValue,boardValue,fontValue);
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	@RequestMapping("disableCategory.na")
	public void disableCategory(String caName, int nmno){
		ns.disableCategory(caName, nmno);
	}
	
	@RequestMapping("insertNeighbor.na")
	public String insertNeighbor(int nmno, HttpServletRequest request){
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		int mno = ns.insertNeighbor(nmno, loginUser.getMid());
		
		try {
			ArrayList<Alarm> alarmList = new ArrayList<Alarm>();
			Alarm alarm = new Alarm();
			
			alarm.setAtno(202);
			alarm.setReceive_mno(mno);
			alarm.setSend_mno(loginUser.getMid());
			
			System.out.println("alarm : " + alarm);
			
			alarmList.add(alarm);
			
			as.alarmRequest(alarmList);
		} catch (alarmRequestException e) {
			e.printStackTrace();
		}
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	@RequestMapping("deleteNeighbor.na")
	public String deleteNeighbor(int nmno, HttpServletRequest request){
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		ns.deleteNeighbor(nmno, loginUser.getMid());
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	//비밀글 구매하기
	@RequestMapping("buyHidden.na")
	public void buyHidden(int bno, HttpServletRequest request, HttpServletResponse response){
		String str = "";
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Board b = nms.selectBoardOne(bno);
		
		int result;
		
		try {
			result = ups.insertUsePoint(b, loginUser,ps.selectTotalPoint(loginUser.getMid()));
			
			switch(result){
				case -1:
					str = "잔고가 부족합니다.";
					break;
				default:
					str = "구매 완료.";
					break;
			}
			
			try {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				new Gson().toJson(str, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (PaymentListSelectException e) {
			e.printStackTrace();
		}
	}
	
	//내 나루 찾기
	@RequestMapping("selectMyNaru.na")
	public void selectMyNaru(int mno, HttpServletResponse response){
		int nmno = ns.checkNaruByMno(mno);
		
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(nmno, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
