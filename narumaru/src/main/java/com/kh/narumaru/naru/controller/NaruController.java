package com.kh.narumaru.naru.controller;

import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.naru.model.service.NaruService;

@Controller
public class NaruController {
	@Autowired
	private NaruService ns;
	
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
	public String updatecategory(ModelAndView mv, int nmno, HttpServletRequest request){
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
	
}
