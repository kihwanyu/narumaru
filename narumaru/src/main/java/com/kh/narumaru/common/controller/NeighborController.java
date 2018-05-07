package com.kh.narumaru.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.common.model.exception.NeighborDeleteException;
import com.kh.narumaru.common.model.exception.NeighborInsertException;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.service.NeighborService;
import com.kh.narumaru.common.model.vo.Alarm;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.member.model.vo.Member;

@Controller
public class NeighborController {
	/*이웃 조회*/
	@Autowired
	private NeighborService nc;
	@Autowired
	private AlarmService as;
	
	@RequestMapping(value="selectNeighborListAjax.nc")
	public void selectNeighborListAjax(int mno, HttpServletResponse response){
		ArrayList<Neighbor> list = nc.selectNeighborListAjax(mno);
		
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="myPageNeighborInsert.nc")
	public ModelAndView myPageNeighborInsert(ModelAndView mv, HttpSession session, @RequestParam int mno, @RequestParam int currentPage){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int user_mno = loginUser.getMid();
		
		Neighbor n = new Neighbor();
		
		n.setMno(mno);
		n.setUser_mno(user_mno);
		
		try {
			nc.myPageNeighborInsert(n);
			
			ArrayList<Alarm> alarmList = new ArrayList<Alarm>();
			Alarm alarm = new Alarm();
			
			alarm.setAtno(202);
			alarm.setReceive_mno(mno);
			alarm.setSend_mno(user_mno);
			
			System.out.println("alarm : " + alarm);
			
			alarmList.add(alarm);
			
			as.alarmRequest(alarmList);
			
			mv.addObject("currentPage", currentPage);
			mv.setViewName("redirect:/naruNeighborListView.me");
		} catch (NeighborInsertException | alarmRequestException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value="myPageNeighborDelete.nc")
	public ModelAndView myPageNeighborDelete(ModelAndView mv, HttpSession session, @RequestParam int mno, @RequestParam int currentPage){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int user_mno = loginUser.getMid();
		
		Neighbor n = new Neighbor();
		
		n.setMno(mno);
		n.setUser_mno(user_mno);
		
		try {
			nc.myPageNeighborDelete(n);
			mv.addObject("currentPage", currentPage);
			mv.setViewName("redirect:/naruNeighborListView.me");
		} catch (NeighborDeleteException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
}
