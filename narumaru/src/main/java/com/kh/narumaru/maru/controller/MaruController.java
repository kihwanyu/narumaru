package com.kh.narumaru.maru.controller;

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
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.vo.Alarm;
import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.service.MaruService;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Controller
@SessionAttributes("nm")
public class MaruController {
	@Autowired
	private MaruService ms;
	@Autowired
	private AlarmService as;
	
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
	
	@RequestMapping("insertMaruMember.ma")
	public void insertMaruMameber(MaruMember mm, HttpServletResponse response, AlarmService as){
		try {
			ms.insertMaruMember(mm);
			int masterMno = ms.getMaruMaster(mm.getNmno());
			
			ArrayList<Alarm> alarm = new ArrayList<>();
			
			// 보낼 유저의 번호를 구한다.
			ArrayList<Integer> sendUser = null;
			sendUser = new ArrayList<Integer>();
			sendUser.add(mm.getMno());
			
			/*Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.*/
			for(int i = 0; i < sendUser.size(); i++){
				alarm.add(new Alarm());
				alarm.get(i).setAtno(300);
				alarm.get(i).setSend_mno(sendUser.get(i));
				alarm.get(i).setReceive_mno(masterMno);
			}
			
			as.alarmRequest(alarm);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("회원가입 완료");
		} catch (MaruException | IOException e) {
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(e.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (alarmRequestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@RequestMapping("countMaruMember.ma")
	public void countMaruMamber(int nmno, HttpServletResponse response){
		try {
			int result = ms.countMaruMember(nmno);
			response.getWriter().print(result);
		} catch (MaruException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectMaruList.ma")
	public void selectMaruList(int mno, HttpServletResponse response){
		System.out.println(mno);
		
		try {
			ArrayList maruList = ms.selectMaruList(mno);
			System.out.println(maruList);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(maruList, response.getWriter());
		} catch (MaruException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectOneMaru.ma")
	public ModelAndView selectOneMaru(int nmno, ModelAndView mv, Narumaru nm){
		try {
			nm = ms.selectOneMaru(nmno);
			mv.addObject("nm", nm);
			mv.setViewName("maru/maruBoard");
		} catch (MaruException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");	
		}
		
		return mv;
	}
	
	@RequestMapping("selectMaruMemberList.ma")
	public void selectMaruMemberList(int nmno, HttpServletResponse response){
		ArrayList maruMemberList;
		try {
			maruMemberList = ms.selectMaruMemberList(nmno);
			System.out.println("memberlist : " + maruMemberList);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(maruMemberList, response.getWriter());
		} catch (MaruException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
