package com.kh.narumaru.narumaru.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.narumaru.model.service.NarumaruService;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Controller
public class NarumaruController {
	@Autowired
	NarumaruService nms;
	
	@RequestMapping(value = "boardListAll.bo", method = RequestMethod.POST)
	public ModelAndView showBoardList(int nmno, ModelAndView mv){
		System.out.println("조회하는 나루마루번호 " + nmno);
		
		ArrayList<Board> list = nms.selectBoardList(nmno); 
		Narumaru nm = nms.selectNarumaruOne(nmno);
		
		//글 리스트와 함께 보려는 나루마루의 정보를 함께 넘긴다
		mv.addObject("list", list);
		mv.addObject("nm",nm);
		mv.setViewName("naru/naruBoard");
		
		return mv;
	}
}
