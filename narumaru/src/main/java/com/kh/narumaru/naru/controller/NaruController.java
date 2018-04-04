package com.kh.narumaru.naru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaruController {
	
	@RequestMapping("naruMain.na")
	public String showNaruMainView(){
		System.out.println("나후로도?");
		return "naru/naruMainPage";
	}
	
}
