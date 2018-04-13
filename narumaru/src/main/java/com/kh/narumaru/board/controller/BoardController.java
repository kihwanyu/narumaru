package com.kh.narumaru.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.board.model.service.BoardService;
import com.kh.narumaru.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	BoardService bs;
	
	@RequestMapping(value = "boardListAll.bo", method = RequestMethod.POST)
	public ModelAndView showBoardList(int nmno, ModelAndView mv){
		System.out.println("조회하는 나루번호 " + nmno);
		
		ArrayList<Board> list = bs.getBoardListAll(nmno); 
		
		mv.addObject("list", list);
		mv.setViewName("naru/naruBoard");
		
		return mv;
	}
}
