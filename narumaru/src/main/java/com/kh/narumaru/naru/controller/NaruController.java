package com.kh.narumaru.naru.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("updateCategory.na")
	public void updatecategory(ModelAndView mv, int nmno, HttpServletRequest request){
		int i=0;
		ArrayList<String> categorys = new ArrayList<String>(); 
		
		while(true){
			String temp = "addedCategory" + i++;
		
			String cate = request.getParameter(temp);
			
			if(cate == null){
				break;
			}else{
				System.out.println(cate);
				categorys.add(cate);
			}
		}
	}
	
	
}
