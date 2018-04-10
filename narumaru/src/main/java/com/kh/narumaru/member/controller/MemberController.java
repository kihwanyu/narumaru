package com.kh.narumaru.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.member.model.service.MemberService;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.member.model.exception.LoginException;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView showMainView(Member m, ModelAndView mv, SessionStatus status ){
		
	
		System.out.println("controller Member : " + m);
		
		//System.out.println("암호 일치 여부 확인 : " + passwordEncoder.matches("pass01", "$2a$10$DEDHUZOux.CEoctwh7R3ZexGZEUaCn0y8MZO.zSHoxH7zRaQhHSUu"));

		/*MemberService ms = new MemberServiceImpl();*/
		
		try {
			Member loginUser = ms.loginMember(m);
			
			//session.setAttribute("loginUser", loginUser);
			
			/*return "main/main";*/
			
			mv.addObject("loginUser", loginUser);
			status.setComplete();
			mv.setViewName("main/main");
			
		} catch (LoginException e) {
			
			//model.addAttribute("message", e.getMessage());
			//return "common/errorPage";
			
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping(value="insertMember.me", method=RequestMethod.POST)
	public String showInsertMember(){
		System.out.println("로그인!!!!!!!");
		
		return "member/memberInsertForm";
	}
	
	
	
}
