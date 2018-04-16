package com.kh.narumaru.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
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
			//status.setComplete();
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
	
	@RequestMapping(value="memberInsert.me")
	public String memberInsert(Member m, Model model, HttpServletRequest request){
		
		System.out.println("컨트롤러 회원가입: " + m);
		
		if(m.getGender().equals("M")){
			m.setGender("남");
		}else{
			m.setGender("여");
		}
		
		try{
			ms.insertMember(m);
			
			return "main/mainLogin";
			
		}catch (Exception e) {
			model.addAttribute("message", "회원가입실패!");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//마이페이지 Info start//
	
	
	//마이페이지 Info end//
	
	// 마이페이지 페이지 이동 start
	@RequestMapping(value="myInfoView.me")
	public ModelAndView myInfoForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_myInfo");
		
		return mv;
	}
	@RequestMapping(value="myboardView.me")
	public ModelAndView myBoardForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_myboard");
		
		return mv;
	}
	@RequestMapping(value="myLoginView.me")
	public ModelAndView myLoginForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_loginRecord");
		
		return mv;
	}
	@RequestMapping(value="invitedMaruView.me")
	public ModelAndView invitedMaruForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_invitedMaru");
		
		return mv;
	}
	@RequestMapping(value="resisteredMaruView.me")
	public ModelAndView resisteredMaruForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_resisteredMaru");
		
		return mv;
	}
	@RequestMapping(value="naruNeighborListView.me")
	public ModelAndView NaruNeighborListForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_NaruNeighborList");
		
		return mv;
	}
	@RequestMapping(value="pointPaymentView.me")
	public ModelAndView pointPaymentForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_pointPayment");
		
		return mv;
	}
	@RequestMapping(value="refundView.me")
	public ModelAndView RefundForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_refund");
		
		return mv;
	}
	// 마이페이지 페이지 이동 end
	
}
