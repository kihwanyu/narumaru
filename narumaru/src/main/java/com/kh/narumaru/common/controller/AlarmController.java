package com.kh.narumaru.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.vo.Alarm;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService as;
	
	@RequestMapping(value="alarmList.al")
	public ModelAndView test(ModelAndView mv){
		
		Alarm alarm = null;
		
		try {
			as.alarmRequest(alarm);
		} catch (alarmRequestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
}
